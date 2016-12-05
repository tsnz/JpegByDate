-- Implementation of Config
package body Config is

   -- checks if
   function Date_Matching(My_Config : PROGRAM_CONFIG; Date : String) return Boolean is
      Date_Invalid : exception;
      Reg_Exp_Str : String := "[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]";
      My_Reg_Exp : Regexp := Compile(Reg_Exp_Str, True, False);
   begin
      if not (Match(Date, My_Reg_Exp)) then
         raise Date_Invalid with "Invalid Date";
      end if;
      for Index in 1..10 loop
         if (My_Config.Date(Index) /= Date(Index) and then My_Config.Date(Index) /= '?') then
            return False;
         end if;
      end loop;
      return True;
   end Date_Matching;

   function Create_Config(Date: String; Name: String; Path: String; Picture_Width : String; Picture_Height : String; Filesize : String;
                         Picture_File_Size : String) return PROGRAM_CONFIG is
      Date_Invalid : exception;
      Image_Size_Invalid : exception;
      My_Config: PROGRAM_CONFIG;
      Date_Exp_Str : String := "[0-9?][0-9?][0-9?][0-9?]-[0-9?][0-9?]-[0-9?][0-9?]";
      Size_Exp_Str : String := "[<=>][0-9]+";
      Filesize_Exp_Str : String := "[<=>][0-9]+[km]?";
      My_Reg_Name : Unbounded_String;
      My_Date_Exp : Regexp := Compile(Date_Exp_Str, True, False);
      My_Size_Exp : Regexp := Compile(Size_Exp_Str, False, False);
      My_Filesize_Exp : Regexp := Compile(Filesize_Exp_Str, False, False);
   begin
      if (Date = "") then
         My_Config.Date := "????-??-??";
      else
         if not (Match(Date, My_Date_Exp)) then
            raise Date_Invalid with "Invalid Date";
         end if;
         My_Config.Date := Date;
      end if;
      if (Name = "" or Name = "b__jpegbydate.adb") then -- if -f *
         My_Config.name := To_Unbounded_String(".*");
      else
         My_Reg_Name := String_Replace_Character(Name, '.', "\.");
         My_Reg_Name := String_Replace_Character(To_String(My_Reg_Name), '*', ".*");
         My_Config.Name := My_Reg_Name;
      end if;
      if (Path = "") then
         My_Config.Folder_Path := To_Unbounded_String(Current_Directory);
      else
         My_Config.Folder_Path := To_Unbounded_String(Path);
      end if;

      -- set constraints for picture dimension
      if (Picture_Height = "") then
         My_Config.Picture_Height := 0;
         My_Config.Picture_Height_Operator := '>';
      else
         -- check if height has required format
         if not (Match(Picture_Height, My_Size_Exp)) then
            raise Image_Size_Invalid with "Invalid Size";
         end if;
         My_Config.Picture_Height_Operator := Picture_Height(Picture_Height'First);
         My_Config.Picture_Height := Integer'Value(Picture_Height((Picture_Height'First + 1)..Picture_Height'Last));
      end if;

      if (Picture_Width = "") then
         My_Config.Picture_Width := 0;
         My_Config.Picture_Width_Operator := '>';
      else
         -- check if width has required format
         if not (Match(Picture_Width, My_Size_Exp)) then
            raise Image_Size_Invalid with "Invalid Size";
         end if;
         My_Config.Picture_Width_Operator := Picture_Width(Picture_Width'First);
         My_Config.Picture_Width := Integer'Value(Picture_Width((Picture_Width'First + 1)..Picture_Width'Last));
      end if;

      -- Get FILESIZE
      if Picture_File_Size = "" then
         My_Config.Picture_File_Size := 0;
         My_Config.Picture_File_Size_Operator := '>';
      else
         -- check if file size has required format
         if not (Match(Picture_File_Size, My_Filesize_Exp)) then
            raise Image_Size_Invalid with "Invalid Size";
         end if;
         -- store operator for comparison
         My_Config.Picture_File_Size_Operator := Picture_File_Size(Picture_File_Size'First);
         case Picture_File_Size(Picture_File_Size'Last) is
            when 'M' | 'm' =>
               My_Config.Picture_File_Size := Long_Integer'Value(Picture_File_Size((Picture_File_Size'First + 1)..(Picture_File_Size'Last - 1))) * 1024 * 1024;
            when 'K' | 'k' =>
               My_Config.Picture_File_Size := Long_Integer'Value(Picture_File_Size((Picture_File_Size'First + 1)..(Picture_File_Size'Last - 1))) * 1024;
            when others =>
               My_Config.Picture_File_Size := Long_Integer'Value(Picture_File_Size((Picture_File_Size'First + 1)..Picture_File_Size'Last));
         end case;
      end if;

      return My_Config;
   end Create_Config;

   function Name_Matching(Config : PROGRAM_CONFIG; Name : String) return Boolean is
      My_Reg_Exp : Regexp;
   begin
      My_Reg_Exp := Compile(To_String(Config.Name), False, False);
      return Match(Name, My_Reg_Exp);
   end Name_Matching;

   function Get_Path(Config: PROGRAM_CONFIG) return String is
   begin
      return To_String(Config.Folder_Path);
   end Get_Path;

   function Dimensions_Matching(Config: PROGRAM_CONFIG; Picture_Width : Integer; Picture_Height : Integer) return Boolean is
   begin
      -- check if width matches limit
      case Config.Picture_Width_Operator is
         when '>' =>
            if Picture_Width <= Config.Picture_Width then
               return false;
            end if;
         when '=' =>
            if not (Picture_Width = Config.Picture_Width) then
               return false;
            end if;
         when '<' =>
            if Picture_Width >= Config.Picture_Width then
               return false;
            end if;
         when others =>
            null;
      end case;
      -- check if height matches limit
      case Config.Picture_Height_Operator is
         when '>' =>
            if Picture_Height <= Config.Picture_Height then
               return false;
            end if;
         when '=' =>
            if not (Picture_Height = Config.Picture_Height) then
               return false;
            end if;
         when '<' =>
            if Picture_Height >= Config.Picture_Height then
               return false;
            end if;
         when others =>
            null;
      end case;

      return True;
   end Dimensions_Matching;

   function Picture_Matching_Criteria(Config : PROGRAM_CONFIG; Pic : PICTURE) return Boolean is
   begin
      if not Name_Matching(Config, To_String(Get_Picture_Name(Pic))) then
         return False;
      end if;

      if not Dimensions_Matching(Config, Get_Picture_Width(Pic), Get_Picture_Height(Pic)) then
         return false;
      end if;

      if not Filesize_Matching(Config, Get_Picture_Filesize(Pic)) then
         return false;
      end if;
      if not Date_Matching(Config, Get_Date_Taken(Pic)) then
         return false;
      end if;

      -- return true if all checks were successfull
      return true;
   end Picture_Matching_Criteria;

   function Filesize_Matching(Config : PROGRAM_CONFIG; Filesize : Long_Integer) return Boolean is
   begin
      case Config.Picture_File_Size_Operator is
         when '>' =>
            if Filesize <= Config.Picture_File_Size then
               return false;
            end if;
         when '=' =>
            if not (Config.Picture_File_Size = Filesize) then
               return false;
            end if;
         when '<' =>
            if Filesize >= Config.Picture_File_Size then
               return false;
            end if;
         when others => null;
      end case;
      return true;
   end Filesize_Matching;
end Config;

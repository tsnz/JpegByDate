-- Implementation of Config
package body Config is

   -- create a config. Requires date template, name template, path to specified folder, picture width with operator, picture height
   -- with operator and filesize with operator and optionally size
   function Create_Config(Date: String; Name: String; Path: String; Picture_Width : String; Picture_Height : String; Filesize : String;
                          Picture_File_Size : String) return PROGRAM_CONFIG is
      My_Config: PROGRAM_CONFIG; -- instance of config that will be returned after values have been set
   begin

      -- use given date to create pattern accordingly
      My_Config.Date := Create_Date_For_Config(Date);

      -- use given name to create pattern accordingly
      My_Config.Name := Create_Name_For_Config(Name);

      -- if no path is given when executing the program the current path is used
      -- otherwise the given path is used
      if (Path = "") then
         My_Config.Folder_Path := To_Unbounded_String(Current_Directory);
      else
         My_Config.Folder_Path := To_Unbounded_String(Path);
      end if;

      -- if program is called without height limits '>0' is used to match every picture
      if (Picture_Height = "") then
         My_Config.Picture_Height := 0;
         My_Config.Picture_Height_Operator := '>';
      else
         -- check if height has required format
         if not (Match(Picture_Height, My_Size_Exp)) then
            raise Image_Size_Invalid with "Invalid height in input parameters";
         end if;
         -- use first character as operator
         My_Config.Picture_Height_Operator := Picture_Height(Picture_Height'First);
         -- use all remaining characters as size
         My_Config.Picture_Height := Integer'Value(Picture_Height((Picture_Height'First + 1)..Picture_Height'Last));
      end if;

      -- if program is called without width limits '>0' is used to match every picture
      if (Picture_Width = "") then
         My_Config.Picture_Width := 0;
         My_Config.Picture_Width_Operator := '>';
      else
         -- check if width has required format
         if not (Match(Picture_Width, My_Size_Exp)) then
            raise Image_Size_Invalid with "Invalid width in input parameters";
         end if;
         -- use first character as operator
         My_Config.Picture_Width_Operator := Picture_Width(Picture_Width'First);
         -- use all remaining characters as size
         My_Config.Picture_Width := Integer'Value(Picture_Width((Picture_Width'First + 1)..Picture_Width'Last));
      end if;

      -- if program is called without a sizelimit '>0' is used to match all pictures
      if Picture_File_Size = "" then
         My_Config.Picture_Filesize := 0;
         My_Config.Picture_Filesize_Operator := '>';
      else
         -- check if filesize has required format
         if not (Match(Picture_File_Size, My_Filesize_Exp)) then
            raise Filesize_Invalid with "Invalid filesize in input parameters";
         end if;
         -- store operator
         My_Config.Picture_Filesize_Operator := Picture_File_Size(Picture_File_Size'First);
         -- process remaining characters depending on whether a unit is given
         case Picture_File_Size(Picture_File_Size'Last) is
            when 'M' | 'm' =>
               My_Config.Picture_Filesize := Long_Integer'Value(Picture_File_Size((Picture_File_Size'First + 1)..(Picture_File_Size'Last - 1))) * 1024 * 1024;
            when 'K' | 'k' =>
               My_Config.Picture_Filesize := Long_Integer'Value(Picture_File_Size((Picture_File_Size'First + 1)..(Picture_File_Size'Last - 1))) * 1024;
            when others =>
               My_Config.Picture_Filesize := Long_Integer'Value(Picture_File_Size((Picture_File_Size'First + 1)..Picture_File_Size'Last));
         end case;
      end if;

      -- return created config
      return My_Config;
   end Create_Config;

   -- create date pattern according to given date and return result
   function Create_Date_For_Config(Date : String) return String is
      Date_Exp_Str : String := "[0-9?][0-9?][0-9?][0-9?]-[0-9?][0-9?]-[0-9?][0-9?]";
      My_Date_Exp : Regexp := Compile(Date_Exp_Str, True, False);
   begin
      -- if no date is given when executing the program every date is accepted
      if (Date = "") then
          return "????-??-??";
      else
         -- check if date has correct format
         if not (Match(Date, My_Date_Exp)) then
            raise Date_Invalid with "Invalid date in input parameters";
         end if;
         return Date;
      end if;

   end Create_Date_For_Config;

   -- create name pattern according to given name and return result
   function Create_Name_For_Config(Name : String) return Unbounded_String is
      My_Reg_Name : Unbounded_String;
   begin
      -- if no name is given when executing the program every name is accepted
      -- when executing the program without a namefilter the variable contais "b__jpepgbydate.adb"; not empty as expected
      if (Name = "" or Name = "b__jpegbydate.adb") then
         return To_Unbounded_String(".*");
      else
         -- Replace . with \.
         -- then replace * with .*
         -- so that regular expressiosn can be used to check if the names match
         My_Reg_Name := String_Replace_Character(Name, '.', "\.");
         My_Reg_Name := String_Replace_Character(To_String(My_Reg_Name), '*', ".*");
         return My_Reg_Name;
      end if;
   end Create_Name_For_Config;

   -- returns path stored in config
   function Get_Path(Config: PROGRAM_CONFIG) return String is
   begin
      return To_String(Config.Folder_Path);
   end Get_Path;

   -- checks if given date matches given config
   function Date_Matching(My_Config : PROGRAM_CONFIG; Date : String) return Boolean is
      Date_Invalid : exception; -- exception thrown if date has wrong format
      -- date format has to be yyyy-mm-dd
      Reg_Exp_Str : String := "[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]";
      My_Reg_Exp : Regexp := Compile(Reg_Exp_Str, True, False); -- compile regular expression
   begin
      -- check if given date has required format
      if not (Match(Date, My_Reg_Exp)) then
         raise Date_Invalid with "Invalid Date";
      end if;
      -- loop over dates and compare them character by character
      for Index in 1..10 loop
         if (My_Config.Date(Index) /= Date(Index) and then My_Config.Date(Index) /= '?') then
            -- return false if dates are not matching
            return False;
         end if;
      end loop;
      -- return true if check was successful
      return True;
   end Date_Matching;

   -- checks if given name matches config
   function Name_Matching(Config : PROGRAM_CONFIG; Name : String) return Boolean is
      My_Reg_Exp : Regexp;
   begin
      -- create regular expression using the name stored in the config
      My_Reg_Exp := Compile(To_String(Config.Name), False, False);
      -- return result of comparison
      return Match(Name, My_Reg_Exp);
   end Name_Matching;

   -- checks if given dimensions match config
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

   -- checks if given picture matches all requirements
   function Picture_Matching_Requirements(Config : PROGRAM_CONFIG; Pic : PICTURE) return Boolean is
   begin
      -- check if name matches config
      if not Name_Matching(Config, To_String(Get_Picture_Name(Pic))) then
         return False;
      end if;

      -- check if dimensions match config
      if not Dimensions_Matching(Config, Get_Picture_Width(Pic), Get_Picture_Height(Pic)) then
         return false;
      end if;

      -- check if filesize matches config
      if not Filesize_Matching(Config, Get_Picture_Filesize(Pic)) then
         return false;
      end if;

      --check if date matches config
      if not Date_Matching(Config, Get_Date_Taken(Pic)) then
         return false;
      end if;

      -- return true if all checks were successfull
      return true;
   end Picture_Matching_Requirements;

   -- check if filesize matches config
   function Filesize_Matching(Config : PROGRAM_CONFIG; Filesize : Long_Integer) return Boolean is
   begin
      -- compare given filesize and config's filesize depending on the config's operator
      case Config.Picture_Filesize_Operator is
         when '>' =>
            if Filesize <= Config.Picture_Filesize then
               return false;
            end if;
         when '=' =>
            if not (Config.Picture_Filesize = Filesize) then
               return false;
            end if;
         when '<' =>
            if Filesize >= Config.Picture_Filesize then
               return false;
            end if;
         when others => null; -- impossible since strig is checked with regular expression
      end case;
      -- return true since requirements are met
      return true;
   end Filesize_Matching;
end Config;

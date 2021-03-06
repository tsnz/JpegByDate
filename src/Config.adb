-- Implementation of Config
package body Config is

   -- create a config. Requires date template, name template, path to specified folder, picture width with operator, picture height
   -- with operator and filesize with operator and optionally size
   function Create_Config
     (Date                    : String;
      Name                    : String;
      Path                    : String;
      Picture_Width           : String;
      Picture_Height          : String;
      Filesize                : String;
      Print_Whole_Path        : Boolean;
      Search_Is_Recursive     : Boolean;
      Append_Date_To_Pictures : Boolean) return PROGRAM_CONFIG
   is
      My_Config : PROGRAM_CONFIG; -- instance of config that will be returned after values have been set
   begin

      -- set all variables that dont have to be ckecked for validity
      My_Config.Print_Whole_Path    := Print_Whole_Path;
      My_Config.Search_Is_Recursive := Search_Is_Recursive;
      My_Config.Append_Date_To_Pictures := Append_Date_To_Pictures;
      -- use given date to create pattern accordingly
      My_Config.Date := Create_Date_For_Config (Date);

      -- use given name to create pattern accordingly
      My_Config.Name := Create_Name_For_Config (Name);

   -- if no path is given when executing the program the current path is used
   -- otherwise the given path is used
      if (Path = "") then
         My_Config.Folder_Path := To_Unbounded_String (Current_Directory);
      else
         My_Config.Folder_Path := To_Unbounded_String (Path);
      end if;

      -- get height and operator accordig to input
      -- if program is called without height limits '>0' is used to match every picture
      Create_Dimension_For_Config
        (Dimension => Picture_Height,
         Operator  => My_Config.Picture_Height_Operator,
         Result    => My_Config.Picture_Height);

      -- get width and operator accordig to input
      -- if program is called without width limits '>0' is used to match every picture
      Create_Dimension_For_Config
        (Dimension => Picture_Width,
         Operator  => My_Config.Picture_Width_Operator,
         Result    => My_Config.Picture_Width);

-- get filesize and operator according to input
-- if program is called without a sizelimit '>0' is used to match all pictures
      Create_Filesize_For_Config
        (Filesize => Filesize,
         Operator => My_Config.Picture_Filesize_Operator,
         Result   => My_Config.Picture_Filesize);

      -- return created config
      return My_Config;
   end Create_Config;

   -- create date pattern according to given date and return result
   function Create_Date_For_Config (Date : String) return String is
      Date_Exp_Str : String :=
        "[0-9?][0-9?][0-9?][0-9?]-[0-9?][0-9?]-[0-9?][0-9?]";
      My_Date_Exp : Regexp := Compile (Date_Exp_Str, True, False);
   begin
      -- if no date is given when executing the program every date is accepted
      if (Date = "") then
         return "????-??-??";
      else
         -- check if date has correct format
         if not (Match (Date, My_Date_Exp)) then
            raise Date_Invalid with "Invalid date in input parameters";
         end if;
         return Date;
      end if;
   end Create_Date_For_Config;

   -- create name pattern according to given name and return result
   function Create_Name_For_Config (Name : String) return Unbounded_String is
      My_Reg_Name : Unbounded_String;
   begin
      -- if no name is given when executing the program every name is accepted
      -- when executing the program without a namefilter the variable contais "b__jpepgbydate.adb"; not empty as expected
      if (Name = "" or Name = "b__jpegbydate.adb") then
         return To_Unbounded_String (".*");
      else
         -- Replace . with \.
         -- then replace * with .*
         -- so that regular expressiosn can be used to check if the names match
         My_Reg_Name := String_Replace_Character (Name, '.', "\.");
         My_Reg_Name :=
           String_Replace_Character (To_String (My_Reg_Name), '*', ".*");
         return My_Reg_Name;
      end if;
   end Create_Name_For_Config;

   -- return width or height and operator after extracting it from the given string
   procedure Create_Dimension_For_Config
     (Dimension : in     String;
      Operator  :    out Character;
      Result    :    out Integer)
   is
      Size_Exp_Str : String := "[<=>][0-9]+";
      My_Size_Exp  : Regexp := Compile (Size_Exp_Str, False, False);
   begin
      -- if dimension is empty '>0' is used to match all pictures
      if (Dimension = "") then
         Result   := 0;
         Operator := '>';
      else
         -- check if height has required format
         if not (Match (Dimension, My_Size_Exp)) then
            raise Image_Size_Invalid with "Invalid height in input parameters";
         end if;
         -- use first character as operator
         Operator := Dimension (Dimension'First);
         -- use all remaining characters as size
         Result :=
           Integer'Value (Dimension ((Dimension'First + 1) .. Dimension'Last));
      end if;
   end Create_Dimension_For_Config;

   -- return filesize and operator after extracting it from the given string
   procedure Create_Filesize_For_Config
     (Filesize : in     String;
      Operator :    out Character;
      Result   :    out Long_Integer)
   is
      Filesize_Exp_Str : String := "[<=>][0-9]+[km]?";
      My_Filesize_Exp  : Regexp := Compile (Filesize_Exp_Str, False, False);
   begin
-- if program is called without a sizelimit '>0' is used to match all pictures
      if Filesize = "" then
         Result   := 0;
         Operator := '>';
      else
         -- check if filesize has required format
         if not (Match (Filesize, My_Filesize_Exp)) then
            raise Filesize_Invalid with "Invalid filesize in input parameters";
         end if;
         -- store operator
         Operator := Filesize (Filesize'First);
         -- process remaining characters depending on whether a unit is given
         case Filesize (Filesize'Last) is
            when 'M' | 'm' =>
               Result :=
                 Long_Integer'Value
                   (Filesize ((Filesize'First + 1) .. (Filesize'Last - 1))) *
                 1024 *
                 1024;
            when 'K' | 'k' =>
               Result :=
                 Long_Integer'Value
                   (Filesize ((Filesize'First + 1) .. (Filesize'Last - 1))) *
                 1024;
            when others =>
               Result :=
                 Long_Integer'Value
                   (Filesize ((Filesize'First + 1) .. Filesize'Last));
         end case;
      end if;
   end Create_Filesize_For_Config;

   -- returns path stored in config
   function Get_Path (Config : PROGRAM_CONFIG) return String is
   begin
      return To_String (Config.Folder_Path);
   end Get_Path;

   -- returns true if recursive search is enabled
   function Get_Search_Is_Recursive (Config : PROGRAM_CONFIG) return Boolean is
   begin
      return Config.Search_Is_Recursive;
   end Get_Search_Is_Recursive;

   -- returns true if pictures have to be renamed
   function Get_Append_Date_To_Pictures (Config : PROGRAM_CONFIG) return Boolean is
   begin
      return Config.Append_Date_To_Pictures;
   end Get_Append_Date_To_Pictures;

   -- returns switch to check if whole path has to be printed
   function Get_Print_Whole_Path (Config : PROGRAM_CONFIG) return Boolean is
   begin
      return Config.Print_Whole_Path;
   end Get_Print_Whole_Path;

   -- checks if given date matches given config
   function Date_Matching
     (My_Config : PROGRAM_CONFIG;
      Date      : String) return Boolean
   is
      Date_Invalid : exception; -- exception thrown if date has wrong format
      -- date format has to be yyyy-mm-dd
      Reg_Exp_Str : String := "[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]";
      My_Reg_Exp  : Regexp :=
        Compile (Reg_Exp_Str, True, False); -- compile regular expression
   begin
      -- check if given date has required format
      if not (Match (Date, My_Reg_Exp)) then
         raise Date_Invalid with "Invalid Date";
      end if;
      -- loop over dates and compare them character by character
      for Index in 1 .. 10 loop
         if
           (My_Config.Date (Index) /= Date (Index)
            and then My_Config.Date (Index) /= '?')
         then
            -- return false if dates are not matching
            return False;
         end if;
      end loop;
      -- return true if check was successful
      return True;
   end Date_Matching;

   -- checks if given name matches config
   function Name_Matching
     (Config : PROGRAM_CONFIG;
      Name   : String) return Boolean
   is
      My_Reg_Exp : Regexp;
   begin
      -- create regular expression using the name stored in the config
      My_Reg_Exp := Compile (To_String (Config.Name), False, False);
      -- return result of comparison
      return Match (Name, My_Reg_Exp);
   end Name_Matching;

   -- checks if given dimensions match config
   function Dimensions_Matching
     (Config         : PROGRAM_CONFIG;
      Picture_Width  : Integer;
      Picture_Height : Integer) return Boolean
   is
   begin
      -- check if width matches limit
      -- comperator is chosen on the stored operator in the config
      case Config.Picture_Width_Operator is
         when '>' =>
            if Picture_Width <= Config.Picture_Width then
               return False;
            end if;
         when '=' =>
            if not (Picture_Width = Config.Picture_Width) then
               return False;
            end if;
         when '<' =>
            if Picture_Width >= Config.Picture_Width then
               return False;
            end if;
         when others =>
            null; -- impossible since strig is checked with regular expression
      end case;
      -- check if height matches limit
      -- comperator is chosen on the stored operator in the config
      case Config.Picture_Height_Operator is
         when '>' =>
            if Picture_Height <= Config.Picture_Height then
               return False;
            end if;
         when '=' =>
            if not (Picture_Height = Config.Picture_Height) then
               return False;
            end if;
         when '<' =>
            if Picture_Height >= Config.Picture_Height then
               return False;
            end if;
         when others =>
            null; -- impossible since strig is checked with regular expression
      end case;
      -- return true if tests were successful
      return True;
   end Dimensions_Matching;

   -- checks if given picture matches all requirements
   function Picture_Matching_Requirements
     (Config : PROGRAM_CONFIG;
      Pic    : PICTURE) return Boolean
   is
   begin
      -- check if name matches config
      if not Name_Matching
          (Config,
           To_String (Get_Picture_Filename (Pic)))
      then
         return False;
      end if;

      -- check if dimensions match config
      if not Dimensions_Matching
          (Config,
           Get_Picture_Width (Pic),
           Get_Picture_Height (Pic))
      then
         return False;
      end if;

      -- check if filesize matches config
      if not Filesize_Matching (Config, Get_Picture_Filesize (Pic)) then
         return False;
      end if;

      --check if date matches config
      if not Date_Matching (Config, Get_Date_Taken (Pic)) then
         return False;
      end if;

      -- return true if all checks were successfull
      return True;
   end Picture_Matching_Requirements;

   -- check if filesize matches config
   function Filesize_Matching
     (Config   : PROGRAM_CONFIG;
      Filesize : Long_Integer) return Boolean
   is
   begin
      -- compare given filesize and config's filesize depending on the config's operator
      case Config.Picture_Filesize_Operator is
         when '>' =>
            if Filesize <= Config.Picture_Filesize then
               return False;
            end if;
         when '=' =>
            if not (Config.Picture_Filesize = Filesize) then
               return False;
            end if;
         when '<' =>
            if Filesize >= Config.Picture_Filesize then
               return False;
            end if;
         when others =>
            null; -- impossible since strig is checked with regular expression
      end case;
      -- return true since requirements are met
      return True;
   end Filesize_Matching;
end Config;

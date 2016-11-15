-- Implementation of Config
package body Config is

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

   function Create_Config(Date: String; Name: String; Path: String) return PROGRAM_CONFIG is
      Date_Invalid : exception;
      My_Config: PROGRAM_CONFIG;
      Reg_Exp_Str : String := "[0-9?][0-9?][0-9?][0-9?]-[0-9?][0-9?]-[0-9?][0-9?]";
      My_Reg_Name : Unbounded_String;
      My_Reg_Exp : Regexp := Compile(Reg_Exp_Str, True, False);
   begin
      if (Date = "") then
         My_Config.Date := "????-??-??";
      else
         if not (Match(Date, My_Reg_Exp)) then
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
         My_Config.Path := To_Unbounded_String(Current_Directory);
      else
         My_Config.Path := To_Unbounded_String(Path);
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
      return To_String(Config.Path);
   end Get_Path;


   function Picture_Matching_Criteria(Config : PROGRAM_CONFIG; Pic : PICTURE) return Boolean is
   begin
      if(Name_Matching(Config, To_String(Get_Picture_Name(Pic)))) then
         return True;
      else
         return False;
      end if;
   end Picture_Matching_Criteria;
end Config;

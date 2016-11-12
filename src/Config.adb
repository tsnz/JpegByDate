-- Implementation of Config
package body Config is

   function Date_Matching(MyConfig : PROGRAM_CONFIG; Date : String) return Boolean is
      Date_Invalid : exception;
      Reg_Exp_Str : String := "[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]";
      My_Reg_Exp : Regexp := Compile(Reg_Exp_Str, True, False);
   begin
      if not (Match(Date, My_Reg_Exp)) then
         raise Date_Invalid with "Invalid Date";
      end if;
      for Index in 1..10 loop
         if (MyConfig.Date(Index) /= Date(Index) and then MyConfig.Date(Index) /= '?') then
            return False;
         end if;
      end loop;
      return True;
   end Date_Matching;

   function Create_Config(Date : String) return PROGRAM_CONFIG is
      Date_Invalid : exception;
      My_Config: PROGRAM_CONFIG;
      Reg_Exp_Str : String := "[0-9?][0-9?][0-9?][0-9?]-[0-9?][0-9?]-[0-9?][0-9?]";
      My_Reg_Exp : Regexp := Compile(Reg_Exp_Str, True, False);
   begin
      if not (Match(Date, My_Reg_Exp)) then
         raise Date_Invalid with "Invalid Date";
      end if;
      My_Config.Date := Date;
      return My_Config;
   end Create_Config;

   function Create_Config(Date: String; Name: String) return PROGRAM_CONFIG is
      Date_Invalid : exception;
      My_Config: PROGRAM_CONFIG;
      Reg_Exp_Str : String := "[0-9?][0-9?][0-9?][0-9?]-[0-9?][0-9?]-[0-9?][0-9?]";
      My_Reg_Exp : Regexp := Compile(Reg_Exp_Str, True, False);
   begin
      if not (Match(Date, My_Reg_Exp)) then
         raise Date_Invalid with "Invalid Date";
      end if;
      My_Config.Date := Date;
      My_Config.Name := To_Unbounded_String(Name);
      return My_Config;
   end Create_Config;

   function Name_Matching(MyConfig : PROGRAM_CONFIG; Name : String) return Boolean is
      My_Reg_Exp : Regexp;
      My_Reg_Name : Unbounded_String;
   begin
      My_Reg_Name := String_Replace_Character(To_String(MyConfig.Name), '.', "\.");
      My_Reg_Name := String_Replace_Character(To_String(My_Reg_Name), '*', ".*");
      Put_Line(To_String(My_Reg_Name));
      My_Reg_Exp := Compile(To_String(My_Reg_Name), False, False);
      return Match(Name, My_Reg_Exp);
   end Name_Matching;

end Config;

-- Implementation of Config
package body Config is

   function Date_Matching(MyConfig : PROGRAM_CONFIG; Date : String) return Boolean is
   begin
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

end Config;

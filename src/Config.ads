with GNAT.RegExp; use GNAT.RegExp;
-- Interface of Config
package Config is

   type PROGRAM_CONFIG is tagged private;

   function Date_Matching(MyConfig : PROGRAM_CONFIG; Date : String) return Boolean;
   function Create_Config(Date : String) return PROGRAM_CONFIG;

private
   type PROGRAM_CONFIG is tagged
      record
         Date : STRING(1..10);
      end record;

end Config;

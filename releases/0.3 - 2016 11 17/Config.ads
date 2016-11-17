with GNAT.RegExp; use GNAT.RegExp;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings; use Ada.Strings;
With Ada.Strings.Fixed;
With Ada.Strings.Maps;
with Helpers; use Helpers;
with Ada.Directories; use Ada.Directories;
With Pictures; use Pictures;

with Ada.Text_IO; use Ada.Text_IO;
-- Interface of Config
package Config is

   type PROGRAM_CONFIG is tagged private;

   function Date_Matching(My_Config : PROGRAM_CONFIG; Date : String) return Boolean;
   function Name_Matching(Config: PROGRAM_CONFIG; Name : String) return Boolean;
   function Create_Config(Date : String; Name : String; Path : String) return PROGRAM_CONFIG;
   function Get_Path(Config : PROGRAM_CONFIG) return String;
   function Picture_Matching_Criteria(Config : PROGRAM_CONFIG; Pic : PICTURE) return Boolean;

private
   type PROGRAM_CONFIG is tagged
      record
         Date : STRING(1..10);
         Name: Unbounded_String;
         Path: Unbounded_String;
      end record;

end Config;

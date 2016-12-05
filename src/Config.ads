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

   function Create_Config(Date : String; Name : String; Path : String; Picture_Width : String; Picture_Height : String; Filesize : String;
                          Picture_File_Size : String) return PROGRAM_CONFIG;
   function Create_Date_For_Config(Date : String) return String;
   function Create_Name_For_Config(Name : String) return Unbounded_String;
   function Date_Matching(My_Config : PROGRAM_CONFIG; Date : String) return Boolean;
   function Name_Matching(Config: PROGRAM_CONFIG; Name : String) return Boolean;
   function Get_Path(Config : PROGRAM_CONFIG) return String;
   function Picture_Matching_Requirements(Config : PROGRAM_CONFIG; Pic : PICTURE) return Boolean;
   function Dimensions_Matching(Config : PROGRAM_CONFIG; Picture_Width : Integer; Picture_Height : Integer) return Boolean;
   function Filesize_Matching(Config : PROGRAM_CONFIG; Filesize : Long_Integer) return Boolean;

private
   type PROGRAM_CONFIG is tagged
      record
         Date : STRING(1..10);
         Name: Unbounded_String;
         Folder_Path: Unbounded_String;
         Picture_Width: Integer;
         Picture_Height: Integer;
         Picture_Width_Operator: Character;
         Picture_Height_Operator: Character;
         Picture_Filesize: Long_Integer;
         Picture_Filesize_Operator: Character;
      end record;

end Config;

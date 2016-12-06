with GNAT.RegExp;             use GNAT.RegExp;
with Ada.Strings.Unbounded;   use Ada.Strings.Unbounded;
with Ada.Strings;             use Ada.Strings;
with Helpers;                 use Helpers;
with Ada.Directories;         use Ada.Directories;
With Pictures;                use Pictures;

-- Interface of Config
package Config is
   Date_Invalid :       exception; -- raised if date has wrong format
   Image_Size_Invalid : exception; -- raised if width or height has wrong format
   Filesize_Invalid :   exception; -- raised if filesize has wrong format

   type PROGRAM_CONFIG is tagged private;

   function Create_Config (Date : String; Name : String; Path : String; Picture_Width : String; Picture_Height : String; Filesize : String;
                          Print_Whole_Path : Boolean; Search_Is_Recursive : Boolean) return PROGRAM_CONFIG;
   function Create_Date_For_Config (Date : String) return String;
   function Create_Name_For_Config (Name : String) return Unbounded_String;
   procedure Create_Dimension_For_Config (Dimension : IN String; Operator : OUT Character; Result : OUT Integer);
   procedure Create_Filesize_For_Config (Filesize : IN String; Operator : OUT Character; Result : OUT Long_Integer);
   function Date_Matching (My_Config : PROGRAM_CONFIG; Date : String) return Boolean;
   function Name_Matching (Config : PROGRAM_CONFIG; Name : String) return Boolean;
   function Get_Path (Config : PROGRAM_CONFIG) return String;
   function Get_Print_Whole_Path (Config : PROGRAM_CONFIG) return Boolean;
   function Get_Search_Is_Recursive (Config : PROGRAM_CONFIG) return Boolean;
   function Picture_Matching_Requirements (Config : PROGRAM_CONFIG; Pic : PICTURE) return Boolean;
   function Dimensions_Matching (Config : PROGRAM_CONFIG; Picture_Width : Integer; Picture_Height : Integer) return Boolean;
   function Filesize_Matching (Config : PROGRAM_CONFIG; Filesize : Long_Integer) return Boolean;

private
   type PROGRAM_CONFIG is tagged
      record
         Date :                      STRING(1..10);
         Name :                      Unbounded_String;
         Folder_Path :               Unbounded_String;
         Picture_Width :             Integer;
         Picture_Height :            Integer;
         Picture_Width_Operator :    Character;
         Picture_Height_Operator :   Character;
         Picture_Filesize :          Long_Integer;
         Picture_Filesize_Operator : Character;
         Print_Whole_Path :          Boolean;
         Search_Is_Recursive :       Boolean;
      end record;

end Config;

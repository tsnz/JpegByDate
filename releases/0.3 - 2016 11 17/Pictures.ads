-- Interface of Pictures
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with GNAT.RegExp; use GNAT.RegExp;
with Ada.Text_IO; use Ada.Text_IO;
package Pictures is

   type PICTURE is tagged private;

   function Get_Aperature(Pic : PICTURE) return Integer;
   function Get_Exposure_Time(Pic : PICTURE) return Integer;
   function Get_Date_Edited(Pic : PICTURE) return String;
   function Get_Date_Taken(Pic : PICTURE) return String;
   function Get_Coordinates(Pic : PICTURE) return String;
   function Get_Picture_Name(Pic : PICTURE) return Unbounded_String;
   function Get_Picture_Path(Pic : PICTURE) return Unbounded_String;
   function Create_Picture(Filename : Unbounded_String; Path : Unbounded_String; Aparture : Integer; Exposure_Time : Integer;
                           Date_Edited : String; Date_Taken : String; Coordinates : String) return PICTURE;
   procedure Print_Picture_To_Console(Pic : PICTURE);
private
   type PICTURE is tagged
      record
         Filename : Unbounded_String;
         Path : Unbounded_String;
         Aperture : Integer;
         Exposure_Time : Integer;
         Date_Edited : String(1..10);
         Date_Taken : String(1..10);
         Coordinates : String(1..20);
      end record;

end Pictures;

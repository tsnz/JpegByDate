-- Interface of Pictures
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
package Pictures is

   type PICTURE is tagged;

   function Get_Aperature(Pic : PICTURE) return Integer;
   function Get_Exposure_Time(Pic : PICTURE) return Integer;
   function Get_Date_Edited(Pic : PICTURE) return String;
   function Get_Date_Taken(Pic : PICTURE) return String;
   function Get_Coordinates(Pic : PICTURE) return String;
   function Create_Picture(ExposureTime : Integer) return PICTURE;


   type PICTURE is tagged
      record
         Filename : Unbounded_String;
         Aperture : Integer;
         Exposure_Time : Integer;
         Date_Edited : String(1..10);
         Date_Taken : String(1..10);
         Coordinates : String(1..20);
      end record;

end Pictures;

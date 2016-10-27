-- Interface of Pictures
package Pictures is

   type DATE is
      record
         Day : Integer range 1..31;
         Month : Integer range 1..12;
         Year : Integer range 1..9999;
   end record;

   type PICTURE is
      record
         Aperture : Integer;
         Exposure_Time : Integer;
         Date_Edited : DATE;
         Date_Taken : DATE;
         Coordinates : String(1..20);
      end record;



   function Get_Aperature(Pic : PICTURE) return Integer;
   function Get_Exposure_Time(Pic : PICTURE) return Integer;
   function Get_Date_Edited(Pic : PICTURE) return DATE;
   function Get_Date_Taken(Pic : PICTURE) return DATE;
   function Get_Coordinates(Pic : PICTURE) return String;

end Pictures;

-- Implementation of Pictures
package body Pictures is

   function Get_Aperature(Pic : PICTURE) return Integer is
   begin
      return Pic.Aperture;
   end Get_Aperature;

   function Get_Exposure_Time(Pic : PICTURE) return Integer is
   begin
      return Pic.Exposure_Time;
   end Get_Exposure_Time;

   function Get_Date_Edited(Pic : PICTURE) return DATE is
   begin
      return Pic.Date_Edited;
   end Get_Date_Edited;

   function Get_Date_Taken(Pic : PICTURE) return DATE is
   begin
      return Pic.Date_Taken;
   end Get_Date_Taken;

   function Get_Coordinates(Pic : PICTURE) return String is
   begin
      return Pic.Coordinates;
   end Get_Coordinates;

   function Create_Picture(ExposureTime : Integer) return PICTURE is
      Temp : PICTURE;
   begin
      Temp.Exposure_Time := ExposureTime;
      return Temp;
   end Create_Picture;


end Pictures;

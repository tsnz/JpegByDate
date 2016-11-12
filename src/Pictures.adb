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

   function Get_Date_Edited(Pic : PICTURE) return String is
   begin
      return Pic.Date_Edited;
   end Get_Date_Edited;

   function Get_Date_Taken(Pic : PICTURE) return String is
   begin
      return Pic.Date_Taken;
   end Get_Date_Taken;

   function Get_Coordinates(Pic : PICTURE) return String is
   begin
      return Pic.Coordinates;
   end Get_Coordinates;


   function Get_Filename(Pic : PICTURE) return Unbounded_String is
   begin
      return Pic.Filename;
   end Get_Filename;

   function Get_Picture_Path(Pic : PICTURE) return Unbounded_String is
   begin
      return Pic.Path;
   end Get_Picture_Path;

   function Create_Picture(Filename : Unbounded_String; Path : Unbounded_String; Aparture : Integer; Exposure_Time : Integer;
                           Date_Edited : String; Date_Taken : String; Coordinates : String) return PICTURE is
      Temp : PICTURE;
      Date_Invalid : exception;
      Reg_Exp_Str : String := "[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]";
      My_Reg_Exp : Regexp := Compile(Reg_Exp_Str, True, False);
   begin
      if not (Match(Date_Edited, My_Reg_Exp)) then
         raise Date_Invalid with "Invalid Date_Edited";
      end if;
      if not (Match(Date_Taken, My_Reg_Exp)) then
         raise Date_Invalid with "Invalid Date_Taken";
      end if;
      Temp.Filename := Filename;
      Temp.Aperture := Aparture;
      Temp.Exposure_Time := Exposure_Time;
      Temp.Path := Path;
      return Temp;
   end Create_Picture;


end Pictures;

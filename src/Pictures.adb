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

   function Get_Picture_Name(Pic : PICTURE) return Unbounded_String is
   begin
      return Pic.Filename;
   end Get_Picture_Name;

   function Get_Picture_Path(Pic : PICTURE) return Unbounded_String is
   begin
      return Pic.Path;
   end Get_Picture_Path;

   function Get_Picture_Width(Pic : PICTURE) return Integer is
   begin
      return Pic.Picture_Width;
   end Get_Picture_Width;

   function Get_Picture_Height(Pic : PICTURE) return Integer is
   begin
      return Pic.Picture_Height;
   end Get_Picture_Height;

   function Get_Picture_Filesize(Pic : PICTURE) return Long_Integer is
   begin
      return Pic.Filesize;
   end Get_Picture_Filesize;

   function Create_Picture(Filename : Unbounded_String; Path : Unbounded_String; Aparture : Integer; Exposure_Time : Integer;
                           Date_Edited : String; Date_Taken : String; Width : Integer; Height : Integer; Filesize : Long_Integer) return PICTURE is
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
      Temp.Picture_Width := Width;
      Temp.Picture_Height := Height;
      Temp.Filesize := Filesize;
      return Temp;
   end Create_Picture;

   procedure Print_Picture_To_Console(Pic : PICTURE) is
   begin
      Put_Line(To_String(Pic.Filename));
   end Print_Picture_To_Console;

end Pictures;

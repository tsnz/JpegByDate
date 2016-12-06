-- Implementation of Pictures
package body Pictures is
   -- returns picture's aparture
   function Get_Aperature (Pic : PICTURE) return Integer is
   begin
      return Pic.Aperture;
   end Get_Aperature;

   -- returns picture's exposure time
   function Get_Exposure_Time (Pic : PICTURE) return Integer is
   begin
      return Pic.Exposure_Time;
   end Get_Exposure_Time;

   -- returns the date the picture was last edited
   function Get_Date_Edited (Pic : PICTURE) return String is
   begin
      return Pic.Date_Edited;
   end Get_Date_Edited;

   -- returns the date the picture was taken
   function Get_Date_Taken (Pic : PICTURE) return String is
   begin
      return Pic.Date_Taken;
   end Get_Date_Taken;

   -- returns the picture's filename
   function Get_Picture_Filename (Pic : PICTURE) return Unbounded_String is
   begin
      return Pic.Filename;
   end Get_Picture_Filename;

   -- returns the picture's path including filename
   function Get_Picture_Path (Pic : PICTURE) return Unbounded_String is
   begin
      return Pic.Path;
   end Get_Picture_Path;

   -- returns the picture's width
   function Get_Picture_Width (Pic : PICTURE) return Integer is
   begin
      return Pic.Picture_Width;
   end Get_Picture_Width;

   -- returns the picture's height
   function Get_Picture_Height (Pic : PICTURE) return Integer is
   begin
      return Pic.Picture_Height;
   end Get_Picture_Height;

   -- returns the picture's filesize in byte
   function Get_Picture_Filesize (Pic : PICTURE) return Long_Integer is
   begin
      return Pic.Filesize;
   end Get_Picture_Filesize;

   -- creates new picture
   function Create_Picture
     (Filename      : Unbounded_String;
      Path          : Unbounded_String;
      Aparture      : Integer;
      Exposure_Time : Integer;
      Date_Edited   : String;
      Date_Taken    : String;
      Width         : Integer;
      Height        : Integer;
      Filesize      : Long_Integer) return PICTURE
   is
      My_Picture : PICTURE; -- instance of picture to be returned
      Date_Invalid : exception; -- thrown if any of the dates is invalid
      Reg_Exp_Str : String :=
        "[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]"; -- pattern to check a date
      My_Reg_Exp : Regexp :=
        Compile (Reg_Exp_Str, True, False); -- compile regular expression
   begin
      -- throw an exception if a date does not have the required format
      if not (Match (Date_Edited, My_Reg_Exp)) then
         raise Date_Invalid with "Invalid Date_Edited";
      end if;
      if not (Match (Date_Taken, My_Reg_Exp)) then
         raise Date_Invalid with "Invalid Date_Taken";
      end if;
      -- set remaining attributes according to input parameters
      My_Picture.Date_Edited    := Date_Edited;
      My_Picture.Date_Taken     := Date_Taken;
      My_Picture.Filename       := Filename;
      My_Picture.Aperture       := Aparture;
      My_Picture.Exposure_Time  := Exposure_Time;
      My_Picture.Path           := Path;
      My_Picture.Picture_Width  := Width;
      My_Picture.Picture_Height := Height;
      My_Picture.Filesize       := Filesize;
      return My_Picture;
   end Create_Picture;

   -- print picture to console
   procedure Print_Picture_To_Console
     (Pic              : PICTURE;
      Print_Whole_Path : Boolean)
   is
   begin
      -- print whole path if Print_Whole_Path is true
      -- otherwise only print filename
      if Print_Whole_Path then
         Put_Line (To_String (Pic.Path));
      else
         Put_Line (To_String (Pic.Filename));
      end if;
   end Print_Picture_To_Console;

end Pictures;

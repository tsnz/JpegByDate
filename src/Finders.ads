-- Interface of Finders
with Pictures;        use Pictures;
with Config;          use Config;
with Ada.Directories; use Ada.Directories;
with Ada.Text_IO;     use Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Calendar.Formatting;
with GNAT.Regexp;

package Finders is

   type LIST_OF_PICTURES is array (0 .. 10000) of PICTURE;

   procedure Find_Pictures_Matching_Config
     (Config         : in     PROGRAM_CONFIG;
      Pic_List       :    out LIST_OF_PICTURES;
      Number_Of_Pics :    out Integer);

end Finders;

with GNAT.Command_Line;   use GNAT.Command_Line;
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with GNAT.Strings;  use GNAT.Strings;
with Pictures; use Pictures;
with Finders; use Finders;
with Ada.Strings.Unbounded;

procedure JpegByDate is

   package SU renames Ada.Strings.Unbounded;

   Config : Command_Line_Configuration;
   Date    : aliased String_Access;
   Date_Given : aliased Boolean := False; --default-Wert?
   Filename : aliased String_Access;
   Filename_Given : aliased Boolean := False;
   Path : aliased String_Access;
   Path_Given : aliased Boolean := False;
   Recursion_Enabled : aliased Boolean := False;
   Whole_Path_Enabled : aliased Boolean := False;
   GUI_Mode_Enabled : aliased Boolean := False;
   Tiff_Enabled : aliased Boolean := False;
   Excel_Output_Enabled : aliased Boolean := False;

   -- temporary
   Pics : LIST_OF_PICTURES;
   Test_Date : String(1..10) := "2016-01-01";
   Pic_Amount : Integer;
   Pic_Counter : Integer := 1;
   -------------


   procedure DefineInputParameters is
   begin
      Define_Switch (Config, Date'Access, "-d:",
                     Help => "[To be implemented] Date to be searched for");
      Define_Switch (Config, Filename'Access, "-f:",
                     Help => "[To be implemented] Filename to be searched for");
      Define_Switch (Config, Path'Access, "-p:",
                     Help => "[To be implemented] Path to the folder to be searched");
      Define_Switch (Config, Recursion_Enabled'Access, "-r",
                     Help => "[To be implemented] Enable recursive search in all subfolders");
      Define_Switch (Config, Whole_Path_Enabled'Access, "-w",
                     Help => "[To be implemented] Show the whole path name");
      Define_Switch (Config, GUI_Mode_Enabled'Access, "-g",
                     Help => "[To be implemented] Enter GUI mode");
      Define_Switch (Config, Tiff_Enabled'Access, "-t",
                     Help => "[To be implemented] Add .tiff-files to the search");
      Define_Switch (Config, Excel_Output_Enabled'Access, "-e",
                     Help => "[To be implemented] Enable Excel output");
   end DefineInputParameters;


begin

   DefineInputParameters;

   Getopt(Config);

   --for now returns all .jpg and .jpeg files in the execution directory
   Scan_By_Date(D        => Test_Date,
                Pic_List => Pics,
                Number_Of_Pics => Pic_Amount);

   for Pic_Counter in 1..Pic_Amount loop
      Put_Line(SU.To_String(Pics(Pic_Counter).Filename));
   end loop;



end JpegByDate;




















--with Ada.Text_IO;
--with Ada.Command_Line;

--procedure main is
   --package IO renames Ada.Text_IO;
   --package CL renames Ada.Command_Line;
   --procedure calc(A,B: IN Integer; N: OUT INTEGER) is separate;

   --begin
   --declare
     -- type date is
       --  record
         --   day : integer range 1 .. 31;
           -- month : integer range 1 .. 12;
            --year : integer Range 0 .. 9999;
         --end record;

     -- arg : String := "Test";
      --test : Integer;
   --begin

     -- for i in 1 .. CL.Argument_Count+3 loop
      --   calc(1,2,test);
      --end loop;


      --IO.Put_Line("Argument Count:" & CL.Argument_Count'Img);
   --end;
--end main;

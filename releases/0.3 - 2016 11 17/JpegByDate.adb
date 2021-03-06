with GNAT.Command_Line;   use GNAT.Command_Line;
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with GNAT.Strings;  use GNAT.Strings;
with Pictures; use Pictures;
with Finders; use Finders;
with Ada.Strings.Unbounded;
with Config; use Config;
with Ada.Task_Identification;  use Ada.Task_Identification;

procedure JpegByDate is

   package SU renames Ada.Strings.Unbounded;

   CL_Config : Command_Line_Configuration;
   Date    : aliased String_Access;
   Filename : aliased String_Access;
   Path : aliased String_Access;
   Recursion_Enabled : aliased Boolean := False;
   Whole_Path_Enabled : aliased Boolean := False;
   GUI_Mode_Enabled : aliased Boolean := False;
   Tiff_Enabled : aliased Boolean := False;
   Excel_Output_Enabled : aliased Boolean := False;

   -- temporary
   Pics : LIST_OF_PICTURES;
   Pic_Amount : Integer;
   -------------

   -- Program Config
   My_Config : PROGRAM_CONFIG;

   procedure DefineInputParameters is
   begin
      Define_Switch (CL_Config, Date'Access, "-d:",
                     Help => "[To be implemented] Date to be searched for");
      Define_Switch (CL_Config, Filename'Access, "-f:",
                     Help => "Filter files by name. E.g. '*.jpg'");
      Define_Switch (CL_Config, Path'Access, "-p:",
                     Help => "Search for pictures in given directory");
      Define_Switch (CL_Config, Recursion_Enabled'Access, "-r",
                     Help => "[To be implemented] Enable recursive search in all subfolders");
      Define_Switch (CL_Config, Whole_Path_Enabled'Access, "-w",
                     Help => "[To be implemented] Show the whole path name");
      Define_Switch (CL_Config, GUI_Mode_Enabled'Access, "-g",
                     Help => "[To be implemented] Enter GUI mode");
      Define_Switch (CL_Config, Tiff_Enabled'Access, "-t",
                     Help => "[To be implemented] Add .tiff-files to the search");
      Define_Switch (CL_Config, Excel_Output_Enabled'Access, "-e",
                     Help => "[To be implemented] Enable Excel output");
   end DefineInputParameters;


begin
   -- Get command line parameters
   DefineInputParameters;
   Getopt(CL_Config);
   -- Create config from input parameters
   My_Config := Create_Config(Date.all, Filename.all, Path.all);

   --for now returns all .jpg and .jpeg files in the execution directory
   begin
      Find_Pictures_Matching_Config(Config => My_Config,
                   Pic_List => Pics,
                   Number_Of_Pics => Pic_Amount);
   exception
      when Error: Name_Error =>
         Put_Line("Could not find directory");
         Abort_Task(Current_Task);
      when Error: others =>
         Put_Line("Unexpected error when accessing directory");
         Abort_Task(Current_Task);
   end;

   --for Pic_Counter in 1..Pic_Amount loop
   --   Put_Line(SU.To_String(Get_Picture_Name(Pics(Pic_Counter))));
   --end loop;

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

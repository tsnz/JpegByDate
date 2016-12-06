with GNAT.Command_Line;       use GNAT.Command_Line;
with Ada.Text_IO;             use Ada.Text_IO;
with Ada.Integer_Text_IO;     use Ada.Integer_Text_IO;
with GNAT.Strings;            use GNAT.Strings;
with Ada.Strings.Unbounded;
with Pictures;                use Pictures;
with Finders;                 use Finders;
with Config;                  use Config;
with Ada.Task_Identification; use Ada.Task_Identification;
with Ada.Exceptions;          use Ada.Exceptions;

procedure JpegByDate is

   package SU renames Ada.Strings.Unbounded;

   -- Command Line Argument Data
   CL_Config          : Command_Line_Configuration;
   Date               : aliased String_Access;
   Filename           : aliased String_Access;
   Picture_Width      : aliased String_Access;
   Picture_Height     : aliased String_Access;
   Picture_File_Size  : aliased String_Access;
   Path               : aliased String_Access;
   Recursion_Enabled  : aliased Boolean := False;
   Rename_Enabled     : aliased Boolean := False;
   Whole_Path_Enabled : aliased Boolean := False;

   -- Picture Data
   Pics       : LIST_OF_PICTURES;
   Pic_Amount : Integer;

   -- Program Config
   My_Config : PROGRAM_CONFIG;

   -- Declare Command Line Arguments
   procedure Define_Input_Parameters is
   begin
      Define_Switch
        (CL_Config,
         Date'Access,
         "-d:",
         Help =>
           "Filter files by date. Format has to be 'yyyy-mm-dd'. Wildcards may be used. E.g. '201?-02-??'");
      Define_Switch
        (CL_Config,
         Filename'Access,
         "-f:",
         Help => "Filter files by name. E.g. '*.jpg'");
      Define_Switch
        (CL_Config,
         Picture_Width'Access,
         "-sw:",
         Help =>
           "Limit search by file width. Comperator has to be given. E.g. '<200', '=1020'");
      Define_Switch
        (CL_Config,
         Picture_Height'Access,
         "-sh:",
         Help =>
           "Limit search by file height. Comperator has to be given. E.g. '<200', '=1020'");
      Define_Switch
        (CL_Config,
         Path'Access,
         "-p:",
         Help => "Search for pictures in given directory");
      Define_Switch
        (CL_Config,
         Picture_File_Size'Access,
         "-s:",
         Help =>
           "Limit search by file size. Comperator has to be given. M and K may be used to specify size. E.g. '<200k', '=1020'");
      Define_Switch
        (CL_Config,
         Recursion_Enabled'Access,
         "-r",
         Help =>
           "Enable recursive search in all subfolders");
      Define_Switch
        (CL_Config,
         Whole_Path_Enabled'Access,
         "-w",
         Help => "Show the whole path name");
      Define_Switch
        (CL_Config,
         Rename_Enabled'Access,
         "-rn",
         Help =>
           "[To be implemented] Rename found images. The date the image was taken is added to the filename");
   end Define_Input_Parameters;

begin
   begin
      -- Get command line parameters
      Define_Input_Parameters;
      Getopt (CL_Config);
      -- Create config from input parameters
      My_Config :=
        Create_Config
          (Date.all,
           Filename.all,
           Path.all,
           Picture_Width.all,
           Picture_Height.all,
           Picture_File_Size.all,
           Whole_Path_Enabled,
           Recursion_Enabled);
   exception
      when Error : Date_Invalid =>
         Put ("Exception: ");
         Put_Line (Exception_Name (Error));
         Put (Exception_Message (Error));
         Abort_Task (Current_Task);
      when Error : Image_Size_Invalid =>
         Put ("Exception: ");
         Put_Line (Exception_Name (Error));
         Put (Exception_Message (Error));
         Abort_Task (Current_Task);
      when Error : Filesize_Invalid =>
         Put ("Exception: ");
         Put_Line (Exception_Name (Error));
         Put (Exception_Message (Error));
         Abort_Task (Current_Task);
      when Error : Invalid_Parameter =>
         Put_Line (Exception_Name (Error));
         Put_Line (Exception_Information (Error));
         Put_Line ("Invalid launch parameter. Parameter might be incomplete");
         Abort_Task (Current_Task);
      when Error : others =>
         Put ("Unexpected exception: ");
         Put_Line (Exception_Information (Error));
         Abort_Task (Current_Task);
   end;

   -- returns all picture files matching given config
   begin
      Find_Pictures_Matching_Config
        (Config         => My_Config,
         Pic_List       => Pics,
         Number_Of_Pics => Pic_Amount);
   exception
      when Error : Name_Error =>
         Put_Line ("Could not find directory");
         Abort_Task (Current_Task);
      when Error : others =>
         Put ("Unexpected exception: ");
         Put_Line (Exception_Information (Error));
         Abort_Task (Current_Task);
   end;

end JpegByDate;

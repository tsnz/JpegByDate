with GNAT.Command_Line;   use GNAT.Command_Line;
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with GNAT.Strings;  use GNAT.Strings;

procedure jpegByDate is


   Config : Command_Line_Configuration;
   A_Enabled   : aliased Boolean := False;
   B_Option    : aliased String_Access;
   Long_Option : aliased Integer := 0;

begin
   Define_Switch (Config, A_Enabled'Access, "-a",
                  Help => "Enable option a");
   Define_Switch (Config, B_Option'Access, "-b:",
                  Help => "Enable option b");
   Define_Switch (Config, Long_Option'Access,
                  Long_Switch => "--long=",
                  Help => "Enable long option. Arg is an integer");

   Getopt(Config);
   Put_Line ("File argument was " & Boolean'Image(A_Enabled));


end jpegByDate;

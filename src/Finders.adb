-- Implementation of Printers
with Ada.Directories; use Ada.Directories;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Calendar.Formatting;
with GNAT.RegExp;

package body Finders is

   procedure Find_Pictures_Matching_Config(Config : IN PROGRAM_CONFIG;
                          Pic_List : OUT LIST_OF_PICTURES;
                          Number_Of_Pics : OUT Integer) is
      package SU renames Ada.Strings.Unbounded;
      package CF renames Ada.Calendar.Formatting;
      package RX renames GNAT.Regexp;

      type File_Info_Type is
         record
            Name : SU.Unbounded_String;
         end record;

      File_Info_List : array(1..10000) of File_Info_Type;
      File_Count : Integer := 1;
      Counter : Integer := 1;
      Pic : PICTURE;
      Search_Result : Search_Type;
      Filter : Filter_Type := (Ordinary_File => True,
                               Special_File => False,
                               Directory => False);
      Search_Item : Directory_Entry_Type;
      Name_Of_File : SU.Unbounded_String;
      Path_Of_File : SU.Unbounded_String;
      Pic_File : File_Type;
      Line : SU.Unbounded_String;
      Reg_Exp_Str : String := ".*\.(jpg|jpeg)";
      My_Reg_Exp : RX.Regexp := RX.Compile(Reg_Exp_Str, False, False);
   begin

      Start_Search(Search_Result, Get_Path(Config), "", Filter);
      while (More_Entries(Search_Result)) loop
         Get_Next_Entry(Search_Result, Search_Item);
         Path_Of_File := SU.To_Unbounded_String(Full_Name(Search_Item));
         Name_Of_File := SU.To_Unbounded_String(Simple_Name(Search_Item));

         if (RX.Match(SU.To_String(Name_Of_File), My_Reg_Exp)) then

            Pic := Create_Picture(Name_Of_File,Path_Of_File, 1, 1, "2012-02-02", "2012-01-01", 300, 200, 200);

            if (Picture_Matching_Criteria(Config, Pic)) then
               Pic_List(File_Count) := Pic;
               File_Count := File_Count + 1;
               Print_Picture_To_Console(Pic);
            end if;
         end if;
      end loop;

      Number_Of_Pics := File_Count;
      End_Search(Search => Search_Result);
   end Find_Pictures_Matching_Config;

end Finders;

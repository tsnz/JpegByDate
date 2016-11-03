-- Implementation of Printers
with Ada.Directories; use Ada.Directories;
with Ada.Text_IO; use Ada.Text_IO;

package body Finders is

   procedure Scan_By_Date(D : IN DATE; Pic_List : OUT LIST_OF_PICTURES) is
      Test_Date : DATE := (1, 1, 2016);
      Test_Pic : PICTURE := (5, 1, Test_Date, Test_Date, "TestTestTestTestTest");
      Current_Dir : String := Current_Directory;
      Search_Result : Search_Type;
      Filter : Filter_Type := (Special_File => True, others => False);
      Search_Entry : Directory_Entry_Type;
      Name_Of_File : String(1..1024);
      Pic_File : File_Type;
      Line : String(1..1024);
      Lenght : Natural;
   begin

      Put_Line("Debug Test 1");

      Start_Search(Search_Result, Current_Dir, "", Filter);

      while More_Entries(Search_Result) = True loop
         Put_Line("Debug Test 2");
         Get_Next_Entry(Search_Result, Search_Entry);
         Name_Of_File := Full_Name(Search_Entry);

         if Extension(Name_Of_File) = ".jpg" then
            Open(File => Pic_File, Name => Name_Of_File, Mode => In_File);
            Get_Line(File => Pic_File, Item => Line, Last => Lenght);
            Put_Line(Line);
            -- find Hex-Code 9003 to get the date when the picture was taken
         end if;

      end loop;

      Pic_List := (Test_Pic, Test_Pic, Test_Pic);


   end Scan_By_Date;

end Finders;

-- Implementation of Printers
with Ada.Directories; use Ada.Directories;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Calendar.Formatting;

package body Finders is


   procedure Scan_By_Date(D : IN String;
                          Pic_List : OUT LIST_OF_PICTURES;
                          Number_Of_Pics : OUT Integer) is
      package SU renames Ada.Strings.Unbounded;
      package CF renames Ada.Calendar.Formatting;

      type File_Info_Type is
         record
            Name : SU.Unbounded_String;
         end record;

      File_Info_List : array(1..10000) of File_Info_Type;
      File_Count : Integer := 1;
      Counter : Integer := 1;
      Pic : PICTURE; --(5, 1, Test_Date, Test_Date, "TestTestTestTestTest");
      Current_Dir : String := Current_Directory;
      Search_Result : Search_Type;
      Filter : Filter_Type := (Ordinary_File => True,
                               Special_File => False,
                               Directory => False);
      Search_Item : Directory_Entry_Type;
      Name_Of_File : SU.Unbounded_String;
      Pic_File : File_Type;
      Line : SU.Unbounded_String;
      --Lenght : Natural;
   begin

      Start_Search(Search_Result, Current_Dir, "", Filter);

      while (More_Entries(Search_Result)) loop
         Get_Next_Entry(Search_Result, Search_Item);
         Name_Of_File := SU.To_Unbounded_String(Full_Name(Search_Item));

         if ((Extension(SU.To_String(Name_Of_File)) = "jpg") or (Extension(SU.To_String(Name_Of_File)) = "jpeg")) then
            Pic := (Name_Of_File, 5, 1, D, D, "TestTestTestTestTest");
            Pic_List(File_Count) := Pic;
            File_Count := File_Count + 1;
            --File_Info_List(File_Count) := (Name => Name_Of_File);
            --File_Count := File_Count + 1;
            --Pic := (SU.To_String(Name_Of_File), 1, 1, "2016-01-01", "2016-01-01", "TestTestTestTestTest");
            --Put_Line(CF.Image(Modification_Time(Search_Item)));
            --Open(File => Pic_File, Name => SU.To_String(Name_Of_File), Mode => In_File);
            --Get_Line(File => Pic_File, Item => SU.To_Unbounded_String(Line), Last => Lenght);
            --Put_Line(SU.To_String(Name_Of_File));
            -- find Hex-Code 9003 to get the date when the picture was taken
            --Close(File => Pic_File);
         end if;

      end loop;

      Number_Of_Pics := File_Count;

      End_Search(Search => Search_Result);


   end Scan_By_Date;

end Finders;

-- Implementation of Printers
with Ada.Directories; use Ada.Directories;
with Ada.Text_IO;     use Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Calendar.Formatting;
with GNAT.Regexp;

package body Finders is

   procedure Find_Pictures_Matching_Config
     (Config         : in     PROGRAM_CONFIG;
      Pic_List       :    out LIST_OF_PICTURES;
      Number_Of_Pics :    out Integer)
   is
   begin

      Search_Given_Dir
        (Path           => Get_Path (Config),
         Config         => Config,
         Pic_List       => Pic_List,
         Number_Of_Pics => Number_Of_Pics);

   end Find_Pictures_Matching_Config;

   procedure Search_Given_Dir
     (Path           : in     String;
      Config         : in     PROGRAM_CONFIG;
      Pic_List       : in out LIST_OF_PICTURES;
      Number_Of_Pics : in out Integer)
   is

      package SU renames Ada.Strings.Unbounded;
      package CF renames Ada.Calendar.Formatting;
      package RX renames GNAT.Regexp;

      -- Type for file meta data
      type File_Info_Type is record
         Name : SU.Unbounded_String;
      end record;

      -- File list variables
      File_Info_List : array (1 .. 10000) of File_Info_Type;
      File_Count     : Integer := 1;
      Counter        : Integer := 1;

      -- Search
      Search_Result : Search_Type;
      Filter        : Filter_Type :=
        (Ordinary_File => True, Special_File => False, Directory => False);
      Recursive_Filter : Filter_Type :=
        (Ordinary_File => True, Special_File => False, Directory => True);
      Search_Item : Directory_Entry_Type;
      Reg_Exp_Str : String    := ".*\.(jpg|jpeg|tif|tiff)";
      My_Reg_Exp  : RX.Regexp := RX.Compile (Reg_Exp_Str, False, False);

      -- Single file iteration
      Name_Of_File : SU.Unbounded_String;
      Path_Of_File : SU.Unbounded_String;
      Pic_File     : File_Type;
      Pic          : PICTURE;
      Line         : SU.Unbounded_String;
   begin
      if Get_Search_Is_Recursive (Config) then
         -- Firstly, find all files in the directory
         Start_Search
           (Search    => Search_Result,
            Directory => Path,
            Pattern   => "",
            Filter    => Recursive_Filter);
      else
         Start_Search
           (Search    => Search_Result,
            Directory => Path,
            Pattern   => "",
            Filter    => Filter);
      end if;
      -- Loop over all found files
      while (More_Entries (Search_Result)) loop
         Get_Next_Entry (Search_Result, Search_Item);
         if (Kind (Search_Item) = Directory) then

            if
              (Simple_Name (Search_Item) /= "."
               and then Simple_Name (Search_Item) /= "..")
            then

               Search_Given_Dir
                 (Path           => Full_Name (Search_Item),
                  Config         => Config,
                  Pic_List       => Pic_List,
                  Number_Of_Pics => Number_Of_Pics);

            end if;
         else

            -- Read file name and path
            Path_Of_File := SU.To_Unbounded_String (Full_Name (Search_Item));
            Name_Of_File := SU.To_Unbounded_String (Simple_Name (Search_Item));

            -- Check if the file is a picture
            if (RX.Match (SU.To_String (Name_Of_File), My_Reg_Exp)) then

               -- Fill picture data
               ----------------------
               -- Exif-Placeholders
               ----------------------
               Pic :=
                 Create_Picture
                   (Name_Of_File,
                    Path_Of_File,
                    1,
                    1,
                    "2010-01-01",
                    "2011-01-01",
                    300,
                    200,
                    2000);
               -- Check if picture matches config requirements
               if (Picture_Matching_Requirements (Config, Pic)) then
                  -- Add picture to output
                  Pic_List (File_Count) := Pic;
                  File_Count            := File_Count + 1;
                  Print_Picture_To_Console
                    (Pic,
                     Get_Print_Whole_Path (Config));
               end if;
            end if;
         end if;
      end loop;

      Number_Of_Pics := File_Count;

      -- Search has to be ended manually
      End_Search (Search => Search_Result);
   end Search_Given_Dir;

end Finders;

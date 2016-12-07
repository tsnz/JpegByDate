--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Config.PROGRAM_CONFIG_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with System.Assertions;
with Ada.Text_IO; use Ada.Text_IO;

package body Config.PROGRAM_CONFIG_Test_Data.PROGRAM_CONFIG_Tests is


--  begin read only
   --procedure Test_Create_Config (Gnattest_T : in out Test_PROGRAM_CONFIG);
   --procedure Test_Create_Config_6dc557 (Gnattest_T : in out Test_PROGRAM_CONFIG) renames Test_Create_Config;
--  id:2.2/6dc557989530dff2/Create_Config/1/0/
   --procedure Test_Create_Config (Gnattest_T : in out Test_PROGRAM_CONFIG) is
   --  config.ads:16:4:Create_Config
--  end read only

      --pragma Unreferenced (Gnattest_T);

   --begin

      --AUnit.Assertions.Assert
        --(Gnattest_Generated.Default_Assert_Value,
         --"Test not implemented.");

--  begin read only
   --end Test_Create_Config;
--  end read only


--  begin read only
   procedure Test_Date_Matching (Gnattest_T : in out Test_PROGRAM_CONFIG);
   procedure Test_Date_Matching_dc48aa (Gnattest_T : in out Test_PROGRAM_CONFIG) renames Test_Date_Matching;
--  id:2.2/dc48aab829660b1b/Date_Matching/1/0/
   procedure Test_Date_Matching (Gnattest_T : in out Test_PROGRAM_CONFIG) is
   --  config.ads:36:4:Date_Matching
--  end read only

      Expected_1 : Boolean := True;
      Expected_2 : Boolean := True;
      Expected_3 : Boolean := False;
      Test_Date_1 : String := "2010-03-05";
      Test_Date_2 : String := "2010-05-20";
      Test_Date_3 : String := "2012-03-05";

   begin
      Put ("Run Test_Date_Matching, with filter: ");
      Put_Line (Gnattest_T.Test_Config.Date);
      New_Line;

      Put ("Test 1, with value: ");
      Put_Line (Test_Date_1);
      Put ("Expected matching: ");
      Put_Line (Boolean'Image(Expected_1));
      AUnit.Assertions.Assert (Condition => (Date_Matching(Gnattest_T.Test_Config, Test_Date_1) = Expected_1),
                               Message => "Function is not matching Dates");

      Put ("Test 2, with value: ");
      Put_Line (Test_Date_2);
      Put ("Expected matching: ");
      Put_Line (Boolean'Image(Expected_2));
      AUnit.Assertions.Assert (Condition => (Date_Matching(Gnattest_T.Test_Config, Test_Date_2) = Expected_2),
                               Message => "Function is not matching Dates");

      Put ("Test 3, with value: ");
      Put_Line (Test_Date_3);
      Put ("Expected matching: ");
      Put_Line (Boolean'Image(Expected_3));
      AUnit.Assertions.Assert (Condition => (Date_Matching(Gnattest_T.Test_Config, Test_Date_3) = Expected_3),
                               Message => "Function is not matching Dates");

--  begin read only
   end Test_Date_Matching;
--  end read only


--  begin read only
   procedure Test_Name_Matching (Gnattest_T : in out Test_PROGRAM_CONFIG);
   procedure Test_Name_Matching_b5e4b1 (Gnattest_T : in out Test_PROGRAM_CONFIG) renames Test_Name_Matching;
--  id:2.2/b5e4b1a7ab2d9304/Name_Matching/1/0/
   procedure Test_Name_Matching (Gnattest_T : in out Test_PROGRAM_CONFIG) is
   --  config.ads:39:4:Name_Matching
--  end read only

      Expected_1 : Boolean := True;
      Expected_2 : Boolean := True;
      Expected_3 : Boolean := False;
      Expected_4 : Boolean := False;
      Test_Name_1 : String := "CMD00";
      Test_Name_2 : String := "CMD00324A";
      Test_Name_3 : String := "IMG00";
      Test_Name_4 : String := "CMD01002";

   begin
      Put ("Run Test_Name_Matching, with filter: ");
      Put_Line ("CMD00*"); --(To_String(Gnattest_T.Test_Config.Name));  formatted as regex
      New_Line;

      Put ("Test 1, with value: ");
      Put_Line (Test_Name_1);
      Put ("Expected matching: ");
      Put_Line (Boolean'Image(Expected_1));
      AUnit.Assertions.Assert (Condition => (Name_Matching(Gnattest_T.Test_Config, Test_Name_1) = Expected_1),
                               Message => "Function is not matching Names");

      Put ("Test 2, with value: ");
      Put_Line (Test_Name_2);
      Put ("Expected matching: ");
      Put_Line (Boolean'Image(Expected_2));
      AUnit.Assertions.Assert (Condition => (Name_Matching(Gnattest_T.Test_Config, Test_Name_2) = Expected_2),
                               Message => "Function is not matching Names");

      Put ("Test 3, with value: ");
      Put_Line (Test_Name_3);
      Put ("Expected matching: ");
      Put_Line (Boolean'Image(Expected_3));
      AUnit.Assertions.Assert (Condition => (Name_Matching(Gnattest_T.Test_Config, Test_Name_3) = Expected_3),
                               Message => "Function is not matching Names");

      Put ("Test 4, with value: ");
      Put_Line (Test_Name_4);
      Put ("Expected matching: ");
      Put_Line (Boolean'Image(Expected_4));
      AUnit.Assertions.Assert (Condition => (Name_Matching(Gnattest_T.Test_Config, Test_Name_4) = Expected_4),
                               Message => "Function is not matching Names");

--  begin read only
   end Test_Name_Matching;
--  end read only


--  begin read only
   --procedure Test_Picture_Matching_Requirements (Gnattest_T : in out Test_PROGRAM_CONFIG);
   --procedure Test_Picture_Matching_Requirements_7ac4cb (Gnattest_T : in out Test_PROGRAM_CONFIG) renames Test_Picture_Matching_Requirements;
--  id:2.2/7ac4cb07e34969d3/Picture_Matching_Requirements/1/0/
   --procedure Test_Picture_Matching_Requirements (Gnattest_T : in out Test_PROGRAM_CONFIG) is
   --  config.ads:46:4:Picture_Matching_Requirements
--  end read only

      --pragma Unreferenced (Gnattest_T);

   --begin

      --AUnit.Assertions.Assert
        --(Gnattest_Generated.Default_Assert_Value,
         --"Test not implemented.");

--  begin read only
   --end Test_Picture_Matching_Requirements;
--  end read only


--  begin read only
   procedure Test_Dimensions_Matching (Gnattest_T : in out Test_PROGRAM_CONFIG);
   procedure Test_Dimensions_Matching_6e63a5 (Gnattest_T : in out Test_PROGRAM_CONFIG) renames Test_Dimensions_Matching;
--  id:2.2/6e63a5787cbb8d36/Dimensions_Matching/1/0/
   procedure Test_Dimensions_Matching (Gnattest_T : in out Test_PROGRAM_CONFIG) is
   --  config.ads:49:4:Dimensions_Matching
--  end read only

      Expected_1 : Boolean := True;
      Expected_2 : Boolean := False;
      Expected_3 : Boolean := True;
      Expected_4 : Boolean := False;
      Correct_Width : Integer := 1500;
      Correct_Height : Integer := 1000;
      Test_Width_1 : Integer := 1500;
      Test_Width_2 : Integer := 1800;
      Test_Height_1 : Integer := 1000;
      Test_Height_2 : Integer := 800;

   begin
      Put ("Run Test_Dimensions_Matching, for width with filter: ");
      Put_Line ("<1600");  --Integer'Image(Gnattest_T.Test_Config.Picture_Width));  formatted as regex

      Put ("Test 1, with value: ");
      Put_Line (Integer'Image(Test_Width_1));
      Put ("Expected matching: ");
      Put_Line (Boolean'Image(Expected_1));
      AUnit.Assertions.Assert (Condition => (Dimensions_Matching(Gnattest_T.Test_Config, Test_Width_1, Correct_Height) = Expected_1),
                               Message => "Function is not matching Dimensions");

      Put ("Test 2, with value: ");
      Put_Line (Integer'Image(Test_Width_2));
      Put ("Expected matching: ");
      Put_Line (Boolean'Image(Expected_2));
      AUnit.Assertions.Assert (Condition => (Dimensions_Matching(Gnattest_T.Test_Config, Test_Width_2, Correct_Height) = Expected_2),
                               Message => "Function is not matching Dimensions");

      New_Line;
      Put ("Run Test, for height with filter: ");
      Put_Line (">900");  --Integer'Image(Gnattest_T.Test_Config.Picture_Height));  formatted as regex

      Put ("Test 1, with value: ");
      Put_Line (Integer'Image(Test_Height_1));
      Put ("Expected matching: ");
      Put_Line (Boolean'Image(Expected_3));
      AUnit.Assertions.Assert (Condition => (Dimensions_Matching(Gnattest_T.Test_Config, Correct_Width, Test_Height_1) = Expected_1),
                               Message => "Function is not matching Dimensions");

      Put ("Test 2, with value: ");
      Put_Line (Integer'Image(Test_Height_2));
      Put ("Expected matching: ");
      Put_Line (Boolean'Image(Expected_4));
      AUnit.Assertions.Assert (Condition => (Dimensions_Matching(Gnattest_T.Test_Config, Correct_Width, Test_Height_2) = Expected_2),
                               Message => "Function is not matching Dimensions");

--  begin read only
   end Test_Dimensions_Matching;
--  end read only


--  begin read only
   procedure Test_Filesize_Matching (Gnattest_T : in out Test_PROGRAM_CONFIG);
   procedure Test_Filesize_Matching_95a62c (Gnattest_T : in out Test_PROGRAM_CONFIG) renames Test_Filesize_Matching;
--  id:2.2/95a62cf80e25f948/Filesize_Matching/1/0/
   procedure Test_Filesize_Matching (Gnattest_T : in out Test_PROGRAM_CONFIG) is
   --  config.ads:53:4:Filesize_Matching
--  end read only

      Expected_1 : Boolean := True;
      Expected_2 : Boolean := False;
      Expected_3 : Boolean := False;
      Test_Size_1 : Long_Integer := 3000000;
      Test_Size_2 : Long_Integer := 1500000;
    -- Maybe additional testing scenario
      --Test_Size_3 : String := "big";

   begin
      Put ("Run Test_Filesize_Matching, with filter: ");
      Put_Line (">2000000");  --Long_Integer'Image(Gnattest_T.Test_Config.Picture_Filesize)); formatted as regex
      New_Line;

      Put ("Test 1, with value: ");
      Put_Line (Long_Integer'Image(Test_Size_1));
      Put ("Expected matching: ");
      Put_Line (Boolean'Image(Expected_1));
      AUnit.Assertions.Assert (Condition => (Filesize_Matching(Gnattest_T.Test_Config, Test_Size_1) = Expected_1),
                               Message => "Function is not matching Filesizes");
      Put ("Test 2, with value: ");
      Put_Line (Long_Integer'Image(Test_Size_2));
      Put ("Expected matching: ");
      Put_Line (Boolean'Image(Expected_2));
      AUnit.Assertions.Assert (Condition => (Filesize_Matching(Gnattest_T.Test_Config, Test_Size_2) = Expected_2),
                               Message => "Function is not matching Filesizes");

    -- Maybe additional
      --Put ("Test 1, with value: ");
      --Put_Line (Test_Size_3);
      --Put ("Expected matching: ");
      --Put_Line (Boolean'Image(Expected_3));
      --AUnit.Assertions.Assert (Condition => (Filesize_Matching(Gnattest_T.Test_Config, Test_Size_3) = Expected_3),
                               --Message => "Function is not matching Filesizes");

--  begin read only
   end Test_Filesize_Matching;
--  end read only

end Config.PROGRAM_CONFIG_Test_Data.PROGRAM_CONFIG_Tests;

--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Config.PROGRAM_CONFIG_Test_Data.PROGRAM_CONFIG_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Config.PROGRAM_CONFIG_Test_Data.PROGRAM_CONFIG_Tests.Test_PROGRAM_CONFIG);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   --Case_1_1_Test_Create_Config_6dc557 : aliased Runner_1.Test_Case;
   Case_2_1_Test_Date_Matching_dc48aa : aliased Runner_1.Test_Case;
   Case_3_1_Test_Name_Matching_b5e4b1 : aliased Runner_1.Test_Case;
   --Case_8_1_Test_Picture_Matching_Requirements_7ac4cb : aliased Runner_1.Test_Case;
   Case_9_1_Test_Dimensions_Matching_6e63a5 : aliased Runner_1.Test_Case;
   Case_10_1_Test_Filesize_Matching_95a62c : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      --Runner_1.Create
        --(Case_1_1_Test_Create_Config_6dc557,
         --"config.ads:16:4:",
         --Test_Create_Config_6dc557'Access);
      Runner_1.Create
        (Case_2_1_Test_Date_Matching_dc48aa,
         "config.ads:36:4:",
         Test_Date_Matching_dc48aa'Access);
      Runner_1.Create
        (Case_3_1_Test_Name_Matching_b5e4b1,
         "config.ads:39:4:",
         Test_Name_Matching_b5e4b1'Access);
      --Runner_1.Create
        --(Case_8_1_Test_Picture_Matching_Requirements_7ac4cb,
         --"config.ads:46:4:",
         --Test_Picture_Matching_Requirements_7ac4cb'Access);
      Runner_1.Create
        (Case_9_1_Test_Dimensions_Matching_6e63a5,
         "config.ads:49:4:",
         Test_Dimensions_Matching_6e63a5'Access);
      Runner_1.Create
        (Case_10_1_Test_Filesize_Matching_95a62c,
         "config.ads:53:4:",
         Test_Filesize_Matching_95a62c'Access);

      --Result.Add_Test (Case_1_1_Test_Create_Config_6dc557'Access);
      Result.Add_Test (Case_2_1_Test_Date_Matching_dc48aa'Access);
      Result.Add_Test (Case_3_1_Test_Name_Matching_b5e4b1'Access);
      --Result.Add_Test (Case_8_1_Test_Picture_Matching_Requirements_7ac4cb'Access);
      Result.Add_Test (Case_9_1_Test_Dimensions_Matching_6e63a5'Access);
      Result.Add_Test (Case_10_1_Test_Filesize_Matching_95a62c'Access);

      return Result'Access;

   end Suite;

end Config.PROGRAM_CONFIG_Test_Data.PROGRAM_CONFIG_Tests.Suite;
--  end read only

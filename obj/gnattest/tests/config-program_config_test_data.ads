--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.


with AUnit.Test_Fixtures;
with Ada.Text_IO; use Ada.Text_IO;
with GNATtest_Generated;

package Config.PROGRAM_CONFIG_Test_Data is

   type PROGRAM_CONFIG_Access is access all GNATtest_Generated.GNATtest_Standard.Config.PROGRAM_CONFIG'Class;

--  begin read only
   type Test_PROGRAM_CONFIG is new AUnit.Test_Fixtures.Test_Fixture
--  end read only
   with record
      Fixture : PROGRAM_CONFIG_Access;
      Test_Config : PROGRAM_CONFIG;
   end record;

   procedure Set_Up (Gnattest_T : in out Test_PROGRAM_CONFIG);
   procedure Tear_Down (Gnattest_T : in out Test_PROGRAM_CONFIG);

end Config.PROGRAM_CONFIG_Test_Data;

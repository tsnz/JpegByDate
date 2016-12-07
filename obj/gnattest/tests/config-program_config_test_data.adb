--  This package is intended to set up and tear down  the test environment.
--  Once created by GNATtest, this package will never be overwritten
--  automatically. Contents of this package can be modified in any way
--  except for sections surrounded by a 'read only' marker.

package body Config.PROGRAM_CONFIG_Test_Data is
   Local_PROGRAM_CONFIG : aliased GNATtest_Generated.GNATtest_Standard.Config.PROGRAM_CONFIG;
   procedure Set_Up (Gnattest_T: in out Test_PROGRAM_CONFIG) is
   begin
      New_Line;
      Put_Line ("Set_Up ...");
      Gnattest_T.Fixture := Local_PROGRAM_CONFIG'Access;
      Gnattest_T.Test_Config := Create_Config (Date         => "2010-0?-??",
                                    Name                    => "CMD00*",
                                    Path                    => "C:\Users\Mustermann\Pictures\Birthday_Party",
                                    Picture_Width           => "<1600",
                                    Picture_Height          => ">900",
                                    Filesize                => ">2000000",
                                    Print_Whole_Path        => False,
                                    Search_Is_Recursive     => False,
                                    Append_Date_To_Pictures => False);
   end Set_Up;

   procedure Tear_Down (Gnattest_T : in out Test_PROGRAM_CONFIG) is
   begin
      Put_Line ("Tear_Down ...");
   end Tear_Down;

end Config.PROGRAM_CONFIG_Test_Data;

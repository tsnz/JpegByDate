pragma Ada_95;
pragma Warnings (Off);
pragma Source_File_Name (ada_main, Spec_File_Name => "b__test_runner.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__test_runner.adb");
pragma Suppress (Overflow_Check);
with Ada.Exceptions;

package body ada_main is

   E177 : Short_Integer; pragma Import (Ada, E177, "system__os_lib_E");
   E013 : Short_Integer; pragma Import (Ada, E013, "system__soft_links_E");
   E019 : Short_Integer; pragma Import (Ada, E019, "system__exception_table_E");
   E128 : Short_Integer; pragma Import (Ada, E128, "ada__io_exceptions_E");
   E044 : Short_Integer; pragma Import (Ada, E044, "ada__strings_E");
   E046 : Short_Integer; pragma Import (Ada, E046, "ada__strings__maps_E");
   E050 : Short_Integer; pragma Import (Ada, E050, "ada__strings__maps__constants_E");
   E091 : Short_Integer; pragma Import (Ada, E091, "ada__tags_E");
   E127 : Short_Integer; pragma Import (Ada, E127, "ada__streams_E");
   E061 : Short_Integer; pragma Import (Ada, E061, "interfaces__c_E");
   E021 : Short_Integer; pragma Import (Ada, E021, "system__exceptions_E");
   E180 : Short_Integer; pragma Import (Ada, E180, "system__file_control_block_E");
   E221 : Short_Integer; pragma Import (Ada, E221, "ada__streams__stream_io_E");
   E175 : Short_Integer; pragma Import (Ada, E175, "system__file_io_E");
   E130 : Short_Integer; pragma Import (Ada, E130, "system__finalization_root_E");
   E125 : Short_Integer; pragma Import (Ada, E125, "ada__finalization_E");
   E132 : Short_Integer; pragma Import (Ada, E132, "system__storage_pools_E");
   E122 : Short_Integer; pragma Import (Ada, E122, "system__finalization_masters_E");
   E164 : Short_Integer; pragma Import (Ada, E164, "system__storage_pools__subpools_E");
   E114 : Short_Integer; pragma Import (Ada, E114, "ada__calendar_E");
   E202 : Short_Integer; pragma Import (Ada, E202, "ada__calendar__time_zones_E");
   E182 : Short_Integer; pragma Import (Ada, E182, "gnat__directory_operations_E");
   E231 : Short_Integer; pragma Import (Ada, E231, "system__assertions_E");
   E059 : Short_Integer; pragma Import (Ada, E059, "system__object_reader_E");
   E039 : Short_Integer; pragma Import (Ada, E039, "system__dwarf_lines_E");
   E134 : Short_Integer; pragma Import (Ada, E134, "system__pool_global_E");
   E009 : Short_Integer; pragma Import (Ada, E009, "system__secondary_stack_E");
   E156 : Short_Integer; pragma Import (Ada, E156, "ada__strings__unbounded_E");
   E198 : Short_Integer; pragma Import (Ada, E198, "ada__directories_E");
   E190 : Short_Integer; pragma Import (Ada, E190, "system__regexp_E");
   E154 : Short_Integer; pragma Import (Ada, E154, "gnat__command_line_E");
   E034 : Short_Integer; pragma Import (Ada, E034, "system__traceback__symbolic_E");
   E173 : Short_Integer; pragma Import (Ada, E173, "ada__text_io_E");
   E106 : Short_Integer; pragma Import (Ada, E106, "ada_containers__aunit_lists_E");
   E086 : Short_Integer; pragma Import (Ada, E086, "aunit_E");
   E088 : Short_Integer; pragma Import (Ada, E088, "aunit__memory_E");
   E108 : Short_Integer; pragma Import (Ada, E108, "aunit__memory__utils_E");
   E120 : Short_Integer; pragma Import (Ada, E120, "aunit__tests_E");
   E099 : Short_Integer; pragma Import (Ada, E099, "aunit__test_filters_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "aunit__time_measure_E");
   E110 : Short_Integer; pragma Import (Ada, E110, "aunit__test_results_E");
   E103 : Short_Integer; pragma Import (Ada, E103, "aunit__assertions_E");
   E142 : Short_Integer; pragma Import (Ada, E142, "aunit__reporter_E");
   E144 : Short_Integer; pragma Import (Ada, E144, "aunit__reporter__gnattest_E");
   E101 : Short_Integer; pragma Import (Ada, E101, "aunit__simple_test_cases_E");
   E227 : Short_Integer; pragma Import (Ada, E227, "aunit__test_fixtures_E");
   E235 : Short_Integer; pragma Import (Ada, E235, "aunit__test_caller_E");
   E152 : Short_Integer; pragma Import (Ada, E152, "aunit__test_suites_E");
   E150 : Short_Integer; pragma Import (Ada, E150, "aunit__run_E");
   E194 : Short_Integer; pragma Import (Ada, E194, "gnattest_main_suite_E");
   E215 : Short_Integer; pragma Import (Ada, E215, "helpers_E");
   E217 : Short_Integer; pragma Import (Ada, E217, "pictures_E");
   E196 : Short_Integer; pragma Import (Ada, E196, "config_E");
   E225 : Short_Integer; pragma Import (Ada, E225, "config__program_config_test_data_E");
   E229 : Short_Integer; pragma Import (Ada, E229, "config__program_config_test_data__program_config_tests_E");
   E233 : Short_Integer; pragma Import (Ada, E233, "config__program_config_test_data__program_config_tests__suite_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      declare
         procedure F1;
         pragma Import (Ada, F1, "config__program_config_test_data__program_config_tests__suite__finalize_body");
      begin
         E233 := E233 - 1;
         F1;
      end;
      E229 := E229 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "config__program_config_test_data__program_config_tests__finalize_spec");
      begin
         F2;
      end;
      E225 := E225 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "config__program_config_test_data__finalize_spec");
      begin
         F3;
      end;
      E196 := E196 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "config__finalize_spec");
      begin
         F4;
      end;
      E217 := E217 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "pictures__finalize_spec");
      begin
         F5;
      end;
      E152 := E152 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "aunit__test_suites__finalize_spec");
      begin
         F6;
      end;
      E227 := E227 - 1;
      declare
         procedure F7;
         pragma Import (Ada, F7, "aunit__test_fixtures__finalize_spec");
      begin
         F7;
      end;
      E099 := E099 - 1;
      E101 := E101 - 1;
      declare
         procedure F8;
         pragma Import (Ada, F8, "aunit__simple_test_cases__finalize_spec");
      begin
         F8;
      end;
      E144 := E144 - 1;
      declare
         procedure F9;
         pragma Import (Ada, F9, "aunit__reporter__gnattest__finalize_spec");
      begin
         F9;
      end;
      E103 := E103 - 1;
      declare
         procedure F10;
         pragma Import (Ada, F10, "aunit__assertions__finalize_spec");
      begin
         F10;
      end;
      E110 := E110 - 1;
      declare
         procedure F11;
         pragma Import (Ada, F11, "aunit__test_results__finalize_spec");
      begin
         F11;
      end;
      declare
         procedure F12;
         pragma Import (Ada, F12, "aunit__test_filters__finalize_spec");
      begin
         F12;
      end;
      declare
         procedure F13;
         pragma Import (Ada, F13, "aunit__tests__finalize_spec");
      begin
         E120 := E120 - 1;
         F13;
      end;
      E173 := E173 - 1;
      declare
         procedure F14;
         pragma Import (Ada, F14, "ada__text_io__finalize_spec");
      begin
         F14;
      end;
      E198 := E198 - 1;
      E190 := E190 - 1;
      declare
         procedure F15;
         pragma Import (Ada, F15, "system__regexp__finalize_spec");
      begin
         F15;
      end;
      declare
         procedure F16;
         pragma Import (Ada, F16, "ada__directories__finalize_spec");
      begin
         F16;
      end;
      E156 := E156 - 1;
      declare
         procedure F17;
         pragma Import (Ada, F17, "ada__strings__unbounded__finalize_spec");
      begin
         F17;
      end;
      declare
         procedure F18;
         pragma Import (Ada, F18, "system__file_io__finalize_body");
      begin
         E175 := E175 - 1;
         F18;
      end;
      E122 := E122 - 1;
      E164 := E164 - 1;
      E134 := E134 - 1;
      declare
         procedure F19;
         pragma Import (Ada, F19, "system__pool_global__finalize_spec");
      begin
         F19;
      end;
      declare
         procedure F20;
         pragma Import (Ada, F20, "system__storage_pools__subpools__finalize_spec");
      begin
         F20;
      end;
      declare
         procedure F21;
         pragma Import (Ada, F21, "system__finalization_masters__finalize_spec");
      begin
         F21;
      end;
      E221 := E221 - 1;
      declare
         procedure F22;
         pragma Import (Ada, F22, "ada__streams__stream_io__finalize_spec");
      begin
         F22;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Exception_Tracebacks : Integer;
      pragma Import (C, Exception_Tracebacks, "__gl_exception_tracebacks");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Exception_Tracebacks := 1;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E019 := E019 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E128 := E128 + 1;
      Ada.Strings'Elab_Spec;
      E044 := E044 + 1;
      Ada.Strings.Maps'Elab_Spec;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E050 := E050 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Streams'Elab_Spec;
      E127 := E127 + 1;
      Interfaces.C'Elab_Spec;
      System.Exceptions'Elab_Spec;
      E021 := E021 + 1;
      System.File_Control_Block'Elab_Spec;
      E180 := E180 + 1;
      Ada.Streams.Stream_Io'Elab_Spec;
      E221 := E221 + 1;
      System.Finalization_Root'Elab_Spec;
      E130 := E130 + 1;
      Ada.Finalization'Elab_Spec;
      E125 := E125 + 1;
      System.Storage_Pools'Elab_Spec;
      E132 := E132 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Storage_Pools.Subpools'Elab_Spec;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E114 := E114 + 1;
      Ada.Calendar.Time_Zones'Elab_Spec;
      E202 := E202 + 1;
      Gnat.Directory_Operations'Elab_Spec;
      System.Assertions'Elab_Spec;
      E231 := E231 + 1;
      System.Object_Reader'Elab_Spec;
      System.Dwarf_Lines'Elab_Spec;
      System.Pool_Global'Elab_Spec;
      E134 := E134 + 1;
      E164 := E164 + 1;
      System.Finalization_Masters'Elab_Body;
      E122 := E122 + 1;
      System.File_Io'Elab_Body;
      E175 := E175 + 1;
      E061 := E061 + 1;
      Ada.Tags'Elab_Body;
      E091 := E091 + 1;
      E046 := E046 + 1;
      System.Soft_Links'Elab_Body;
      E013 := E013 + 1;
      System.Os_Lib'Elab_Body;
      E177 := E177 + 1;
      System.Secondary_Stack'Elab_Body;
      E009 := E009 + 1;
      E039 := E039 + 1;
      E059 := E059 + 1;
      Gnat.Directory_Operations'Elab_Body;
      E182 := E182 + 1;
      Ada.Strings.Unbounded'Elab_Spec;
      E156 := E156 + 1;
      Ada.Directories'Elab_Spec;
      System.Regexp'Elab_Spec;
      E190 := E190 + 1;
      Ada.Directories'Elab_Body;
      E198 := E198 + 1;
      Gnat.Command_Line'Elab_Spec;
      System.Traceback.Symbolic'Elab_Body;
      E034 := E034 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E173 := E173 + 1;
      Gnat.Command_Line'Elab_Body;
      E154 := E154 + 1;
      E088 := E088 + 1;
      E086 := E086 + 1;
      E108 := E108 + 1;
      E106 := E106 + 1;
      Aunit.Tests'Elab_Spec;
      E120 := E120 + 1;
      Aunit.Test_Filters'Elab_Spec;
      Aunit.Time_Measure'Elab_Spec;
      E112 := E112 + 1;
      Aunit.Test_Results'Elab_Spec;
      E110 := E110 + 1;
      Aunit.Assertions'Elab_Spec;
      Aunit.Assertions'Elab_Body;
      E103 := E103 + 1;
      Aunit.Reporter'Elab_Spec;
      E142 := E142 + 1;
      Aunit.Reporter.Gnattest'Elab_Spec;
      E144 := E144 + 1;
      Aunit.Simple_Test_Cases'Elab_Spec;
      E101 := E101 + 1;
      E099 := E099 + 1;
      Aunit.Test_Fixtures'Elab_Spec;
      E227 := E227 + 1;
      E235 := E235 + 1;
      Aunit.Test_Suites'Elab_Spec;
      E152 := E152 + 1;
      E150 := E150 + 1;
      E215 := E215 + 1;
      Pictures'Elab_Spec;
      E217 := E217 + 1;
      Config'Elab_Spec;
      E196 := E196 + 1;
      Config.Program_Config_Test_Data'Elab_Spec;
      Config.Program_Config_Test_Data'Elab_Body;
      E225 := E225 + 1;
      Config.Program_Config_Test_Data.Program_Config_Tests'Elab_Spec;
      E229 := E229 + 1;
      Config.Program_Config_Test_Data.Program_Config_Tests.Suite'Elab_Body;
      E233 := E233 + 1;
      Gnattest_Main_Suite'Elab_Body;
      E194 := E194 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_test_runner");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   C:\Users\D062262\Documents\DHBW\3. Modul\Agile Prozesse\JpegByDate\obj\gnattest\harness\gnattest_generated.o
   --   C:\Users\D062262\Documents\DHBW\3. Modul\Agile Prozesse\JpegByDate\obj\gnattest\harness\test_runner.o
   --   C:\Users\D062262\Documents\DHBW\3. Modul\Agile Prozesse\JpegByDate\obj\Helpers.o
   --   C:\Users\D062262\Documents\DHBW\3. Modul\Agile Prozesse\JpegByDate\obj\Pictures.o
   --   C:\Users\D062262\Documents\DHBW\3. Modul\Agile Prozesse\JpegByDate\obj\Config.o
   --   C:\Users\D062262\Documents\DHBW\3. Modul\Agile Prozesse\JpegByDate\obj\gnattest\harness\config-program_config_test_data.o
   --   C:\Users\D062262\Documents\DHBW\3. Modul\Agile Prozesse\JpegByDate\obj\gnattest\harness\config-program_config_test_data-program_config_tests.o
   --   C:\Users\D062262\Documents\DHBW\3. Modul\Agile Prozesse\JpegByDate\obj\gnattest\harness\config-program_config_test_data-program_config_tests-suite.o
   --   C:\Users\D062262\Documents\DHBW\3. Modul\Agile Prozesse\JpegByDate\obj\gnattest\harness\gnattest_main_suite.o
   --   -LC:\Users\D062262\Documents\DHBW\3. Modul\Agile Prozesse\JpegByDate\obj\gnattest\harness\
   --   -LC:\Users\D062262\Documents\DHBW\3. Modul\Agile Prozesse\JpegByDate\obj\gnattest\harness\
   --   -LC:\gnat\2016\lib\aunit\
   --   -LC:\Users\D062262\Documents\DHBW\3. Modul\Agile Prozesse\JpegByDate\obj\
   --   -LC:/gnat/2016/lib/gcc/i686-pc-mingw32/4.9.4/adalib/
   --   -static
   --   -lgnat
   --   -Wl,--stack=0x2000000
--  END Object file/option list   

end ada_main;

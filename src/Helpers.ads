with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
package Helpers is
   Function String_Replace_Character(Source : String; To_Replace : Character; Replace_With : String) return Unbounded_String;
end Helpers;

package body Helpers is
   Function String_Replace_Character(Source : String; To_Replace : Character; Replace_With : String) return Unbounded_String is
      Return_String : Unbounded_String;
   begin
      for Index in 1..Source'Length loop
         if (Source(Index) = To_Replace) then
            Append(Return_String, Replace_With);
         else
            Append(Return_String, Source(Index));
         end if;
      end loop;
      return Return_String;
   end String_Replace_Character;
end Helpers;

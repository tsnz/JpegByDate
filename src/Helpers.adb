package body Helpers is
   -- replace a chacecter in a string with a string
   Function String_Replace_Character(Source : String; To_Replace : Character; Replace_With : String) return Unbounded_String is
      Return_String : Unbounded_String;
   begin
      -- loop over string
      for Index in 1..Source'Length loop
         -- if given character is found it is replaced by the string
         if (Source(Index) = To_Replace) then
            Append(Return_String, Replace_With);
         else
            Append(Return_String, Source(Index));
         end if;
      end loop;
      -- result is returned
      return Return_String;
   end String_Replace_Character;
end Helpers;

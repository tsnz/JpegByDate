-- Interface of Finders
with Pictures; use Pictures;

package Finders is

   type LIST_OF_PICTURES is array(0..10000) of PICTURE;

   procedure Scan_By_Date(D : IN String;
                          Pic_List : OUT LIST_OF_PICTURES;
                          Number_Of_Pics : OUT Integer);

end Finders;

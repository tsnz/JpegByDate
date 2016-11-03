-- Interface of Finders
with Pictures; use Pictures;

package Finders is

   type LIST_OF_PICTURES is array(1..3) of PICTURE;

   procedure Scan_By_Date(D : IN DATE; Pic_List : OUT LIST_OF_PICTURES);

end Finders;

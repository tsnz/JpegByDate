-- Interface of Finders
with Pictures;
use Pictures;

package Finders is

   type LIST_OF_PICTURES is array(1..10000) of PICTURE;

   function Find(D : IN DATE) return LIST_OF_PICTURES;

end Finders;

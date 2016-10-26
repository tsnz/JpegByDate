-- Implementation of Printers
package body Finders is

   function Find(D : DATE) return LIST_OF_PICTURES is
      Pic_List : LIST_OF_PICTURES;
      Test_Date : DATE := (1, 1, 2016);
      Test_Pic : PICTURE := (5, 1, Test_Date, Test_Date, "Test");
   begin

      Pic_List := (Test_Pic, Test_Pic);
      return Pic_List;
   end Find;

end Finders;

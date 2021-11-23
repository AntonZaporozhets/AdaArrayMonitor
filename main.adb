with Ada.Text_IO, Ada.Long_Integer_Text_IO, package_array;
use Ada.Text_IO, Ada.Long_Integer_Text_IO, package_array;

procedure Main is

begin
   Put("Input a size of array: ");
   size := Integer'Value(Get_Line);
   Put("Input a number of threads: ");
   threads := Integer'Value(Get_Line);
   init_arr(size);

   declare
      var_task : array (1..threads) of my_task;
   begin
      monitor.set_counter(threads);
      for i in 1..threads loop
         var_task(i).start((i-1)*size/threads+1, i*size/threads);
      end loop;
      New_Line;

      monitor.get_result(result);
      Put("Result: ");
      Put_Line(result'img);
      New_Line;
      Put("Check: ");
      Put_Line(part_sum(1, arr'Last)'img);
   end;

end Main;

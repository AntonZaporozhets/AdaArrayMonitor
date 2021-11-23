package package_array is
   
   size : Integer;
   threads : Integer;
   sum : Long_Integer;
   result : Long_Integer;
   arr : array (1..100000) of Long_Integer;
   procedure init_arr(size : Integer);
   function part_sum(left_ind, right_ind : in Integer) return Long_Integer;
   
   task type my_task is
      entry start(l, r : in Integer);
   end my_task;
   
   protected monitor is
      procedure set_part_sum(sps : in Long_Integer);
      procedure set_counter(sc : Integer);
      entry get_result(gr : out Long_Integer);
   private
      result : Long_Integer := 0;
      counter : Integer;
   end monitor;   

end package_array;

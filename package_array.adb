package body package_array is

   procedure init_arr(size : Integer) is
   begin
      for i in 1..size loop
         arr(i) := Long_Integer(i);
      end loop;
   end init_arr;
   
   function part_sum(left_ind, right_ind : in Integer) return Long_Integer is
      sum : Long_Integer := 0;
   begin
      for i in left_ind..right_ind loop
         sum := sum + arr(i);
      end loop;
      return sum;
   end part_sum;
   
   protected body monitor is
      procedure set_part_sum(sps : in Long_Integer) is
      begin
         result := result + sps;
         counter := counter - 1;
      end set_part_sum;   
      
      procedure set_counter(sc : Integer) is
      begin
         counter := sc;
      end set_counter;
      
      entry get_result(gr : out Long_Integer) when counter = 0 is
      begin   
         gr := result;
      end get_result;     
   end monitor;  

   task body my_task is
      left, right : Integer;
      sum : Long_Integer;
   begin
      accept start(l, r : in Integer) do
         left := l;
         right := r;
      end start;
      sum := part_sum(left,right);
      monitor.set_part_sum(sum);
   end my_task;       

end package_array;

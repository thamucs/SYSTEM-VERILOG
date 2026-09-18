`timescale 1ns / 1ps
module piso_tb();
  parameter width = 4;

  logic [width-1:0] s;
  logic clk, rst, load;
  logic q;

  piso_Sv #(width) uut (
    .s(s), .clk(clk), .rst(rst), .load(load), .q(q)
  );

  initial begin
    {s, rst, load, clk} = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    $monitor("the input =%4b, output =%0b, load=%0b, time=%t", s, q, load, $time);
    rst = 1;
    #10; rst = 0;
    #10; load = 1; s = 4'b0011;
    #50; load = 0;
    #50; load = 1; s = 4'b1010;
    #200; $finish;
  end
endmodule
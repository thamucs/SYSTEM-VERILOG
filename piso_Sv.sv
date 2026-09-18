module piso_Sv #(parameter width = 4) (
  input  [width-1:0] s,
  input               clk,
  input               rst,
  input               load,
  output              q
);

  reg [width-1:0] temp;

  always @(posedge clk) begin
    if (rst)
      temp <= {width{1'b0}};
    else if (load)
      temp <= s;
    else
      temp <= {temp[width-2:0], 1'b0};
  end

  assign q = temp[width-1];

endmodule
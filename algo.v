module mul32ff #(parameter W = 31)
  ( input clk,
   input reset,
   input [W:0] x, y,
   output reg [W:0] z1 );
  
 reg [W:0] c1; // {c,z} = x*y
  always @(posedge clk) begin
    if (reset)
      z1<=0;
    else 
     {c1,z1} <= x*y;
  end
endmodule 

module add32ff 
  (input clk,
   input reset,
   input [31:0] x, y,
   output reg[31:0] z);
  
  //reg cout;
  always @(posedge clk) begin
    if (reset) begin
      z <= 0;
      //cout <= 0;
    end
    
    else begin
      z <= x+y;
    end 
  end
endmodule 


module for_horner
  (input clk,
   input reset,
   input [31:0] x1, x2, 
   input [31:0] y1, y2,
   output reg [31:0] z);
  
  wire [31:0] z1, z2;
  
  mul32ff u1(clk,reset,x1,y1,z1);
  mul32ff u2(clk,reset,x2,y2,z2);
  add32ff u3(clk,reset,z1,z2,z);
  
  
endmodule






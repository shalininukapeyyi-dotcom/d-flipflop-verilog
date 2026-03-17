module tb;
reg clk;
reg reset;
reg d;
wire q;
dff dut(.clk(clk), .reset(reset), .d(d), .q(q));
initial begin
     $dumpfile("dff.vcd");
    $dumpvars(0,tb);
    clk=0;
    reset=1;
    d=0;
    $monitor("time=%0d clk=%b reset=%b d=%b q=%b",$time,clk,reset,d,q);
#5 reset=0;
#10 d=1;
#10 d=0;
#10 d=1;
#50 $finish;
end
always #5 clk =~clk;
endmodule

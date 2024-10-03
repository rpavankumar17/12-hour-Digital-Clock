module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss);
   
    always @ (posedge clk)
        begin
            if(reset )
                begin
                    hh=8'b00010010;
                    mm=8'd0;
                    ss=8'd0;
                end
            else if(ena && ~(reset))
                begin
                    if(hh==8'b00010001 && mm==8'b01011001 && ss==8'b01011001)
                        begin
                            hh<=8'b00010010;
                            mm<=8'b00000000;
                            ss<=8'b00000000;
                            pm<=~pm;
                        end
                    else if(hh==8'b00010010 && mm==8'b01011001 && ss==8'b01011001)
                        begin
                            hh<=8'b00000001;
                            mm<=8'b00000000;
                            ss<=8'b00000000;
                            pm<=pm;
                        end
                    else
                        begin
                            if(mm==8'b01011001 && ss==8'b01011001 )
                                begin
                                    if(hh==8'd9)
                                        begin
                                            hh[7:4]<=hh[7:4]+1;
                                            hh[3:0]<=4'd0;
                                        end
                                    else
                                        begin
                                            hh[3:0]<=hh[3:0]+1;
                                        end
                                    mm<=0;
                                    ss<=0;
                                    pm<=pm;
                                   
                                   
                               
                                end
                            else if (~(mm==8'b01011001) && (ss==8'b01011001))
                                begin
                                    if(mm[3:0]==4'd9)
                                        begin
                                            mm[7:4]<=mm[7:4]+1;
                                            mm[3:0]<=4'd0;
                                        end
                                    else
                                        begin
                                            mm<=mm+1;
                                        end
                                       
                                   
                                    hh<=hh;
                                    ss<=8'd0;
                                    pm<=pm;
                                end
                            else
                                begin
                                   
                                    if(ss[3:0]==4'd9)
                                        begin
                                            ss[7:4]<=ss[7:4]+1;
                                            ss[3:0]<=4'd0;
                                        end
                                    else
                                        begin
                                            ss<=ss+1;
                                        end
                                    hh<=hh;
                                    mm<=mm;
                                    pm<=pm;
                                end
                           
                           
                        end
                end
            else
                begin
                    hh<=hh;
                    mm<=mm;
                    ss<=ss;
                    pm<=pm;
                end
        end
endmodule

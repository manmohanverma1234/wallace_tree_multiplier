
module fa(input logic a,b,c,output logic s,ca

    );
    assign s= a^b^c; 
    assign ca=(a&b)+(b&c)+(a&c);
endmodule

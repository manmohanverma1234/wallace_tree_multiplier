module wallace_tree_multi(input logic [3:0]a,b,output logic [7:0]y


    );
    logic p[3:0][3:0];
    logic [11:0]s,c;
//step 1- partially product generation
    always_comb
    begin
      for(int i=0;i<=3;i++)
         for (int j=0;j<=3;j++)
             p[j][i]<=a[j]&b[i];
    end
 //step 2.1- partially addition
 ha h1(p[0][1],p[1][0],s[0],c[0]);
 fa f1(p[0][2],p[1][1],p[2][0],s[1],c[1]);
 fa f2(p[0][3],p[1][2],p[2][1],s[2],c[2]);
 ha h2(p[1][3],p[2][2],s[3],c[3]);
 //step 2.2 partially addition
 ha h3(s[1],c[0],s[4],c[4]);
 fa f3(s[2],c[1],p[3][0],s[5],c[5]);
 fa f4(s[3],c[2],p[3][1],s[6],c[6]);
 fa f5(p[2][3],c[3],p[3][2],s[7],c[7]);
 //step 2.3 partially addition
 ha h4(s[5],c[4],s[8],c[8]);
 fa f6(s[6],c[5],c[8],s[9],c[9]);
 fa f7(s[7],c[6],c[9],s[10],c[10]);
 fa f8(p[3][3],c[7],c[10],s[11],c[11]);
 //last step --
 assign y[0]=p[0][0];
 assign y[1]=s[0];
 assign y[2]=s[4];
 assign y[3]=s[8];
 assign y[4]=s[9];
 assign y[5]=s[10];
 assign y[6]=s[11];
 assign y[7]=c[11];
 
 
endmodule

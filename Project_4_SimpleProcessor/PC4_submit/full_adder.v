module full_adder(a, b, cin, s, cout);
 input a, b, cin;
 output s, cout;
 wire w1, w2, w3;
 
    xor g1(w1, a, b);
    xor g2(s, w1, cin);
    and g3(w2, w1, cin);
    and g4(w3, a, b);
    or g5(cout, w2, w3);
 
endmodule
module FA1 (x, y, z, c, s);

input x, y, z;
output c, s;

wire w1, w2, w3;

xor (w1, x, y);
xor (s, w1, z);
and (w2, x, y);
and (w3, w1, z);
or (c, w2, w3);

endmodule

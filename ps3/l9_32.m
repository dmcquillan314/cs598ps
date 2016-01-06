function l9_32()
MU1 = [3 3];
COV1 = [0.75 0; 0 0.75];
MU2 = [6 6];
COV2 = [0.75 0; 0 0.75];
rng default;
D1 = probDist(MU1, COV1, 100).';
std_d1 = std(D1(1,:));

D2 = probDist(MU2, COV2, 100).';
std_d2 = std(D2(1,:));

D1 = D1.';
D2 = D2.';

[w1, b1] = gdiscriminant(MU1, std_d1, 0.5);
[w2, b2] = gdiscriminant(MU2, std_d2, 0.5);

l9_plotlinear(D1, D2, w1, w2, b1, b2);
end
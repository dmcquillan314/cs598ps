function l9_33()
MU1 = [1 1];
COV1 = [2 1; 1 1];
MU2 = [5 5];
COV2 = [0.8 0; 0 0.8];

D1 = probDist(MU1, COV1, 100);
D2 = probDist(MU2, COV2, 100);

[bw1, lw1, iw1] = gdiscriminant2(MU1.',COV1,0.5);
[bw2, lw2, iw2] = gdiscriminant2(MU2.',COV2,0.5);

l9_plotquad(D1,D2,bw1,bw2,lw1,lw2,iw1,iw2);
end

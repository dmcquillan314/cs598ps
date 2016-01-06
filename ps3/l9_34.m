function l9_34()
MU1 = [3 3];
COV1 = [1.95 1.8; 1.8 1.95];
MU2 = [5 5];
COV2 = [1.2 0; 0 1.2];

D1 = probDist(MU1, COV1, 100);
D2 = probDist(MU2, COV2, 100);

[bw1, lw1, iw1] = gdiscriminant2(MU1.',COV1,0.5);
[bw2, lw2, iw2] = gdiscriminant2(MU2.',COV2,0.5);

l9_plotquad(D1,D2,bw1,bw2,lw1,lw2,iw1,iw2);


MU1 = [6 6];
COV1 = [3 0; 0 3];
MU2 = [7 7];
COV2 = [0.2 0; 0 0.2];

D1 = probDist(MU1, COV1, 100);
D2 = probDist(MU2, COV2, 100);

[bw1, lw1, iw1] = gdiscriminant2(MU1.',COV1,0.5);
[bw2, lw2, iw2] = gdiscriminant2(MU2.',COV2,0.5);

l9_plotquad(D1,D2,bw1,bw2,lw1,lw2,iw1,iw2);
axis([0 10 0 10]);
end

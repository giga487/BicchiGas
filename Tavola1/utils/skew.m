function S = skew(w)
    S3 = w(3);
    S2 = w(2);
    S1 = w(1);

    S = [0, -S3, S2;
         S3, 0, -S1;
         -S2, S1, 0;];
end
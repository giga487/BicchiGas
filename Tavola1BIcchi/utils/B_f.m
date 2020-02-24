
function B = B_f(Jp,Jo,m,a)

    Bp1 = simplify(m*(Jp')*Jo);
    Bo1 = simplify((Jo')*I_f(m,a)*(Jo));

    B = Bp1+Bo1;
end
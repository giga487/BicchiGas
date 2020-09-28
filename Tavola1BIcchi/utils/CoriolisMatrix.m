

function C = CoriolisMatrix(B,q,dq)

    [r,n] = size(B);
    [rq, cq] = size(q);
    sym C_ real
    syms e gamma_ real 
    mezzo = 0.5;
   
    for i = 1:1:r
        for j = 1:1:n
            for k = 1:1:n
               %e(k) = b*(diff(B(i,j),q(k)) + diff(B(i,k),q(j)) - diff(B(j,k),q(i)))*dq(k);
               gamma_(k,1) = mezzo*(diff(B(i,j),q(k)) + diff(B(i,k),q(j)) - diff(B(j,k),q(i)))*dq(k);
               
            end
            C_(i,j) = sum(gamma_);
            
        end
        
    end
    
     C = simplify(C_);
end
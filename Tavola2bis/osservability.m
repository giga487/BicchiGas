
dh = jacobian(h, q);

Lfh = jacobian(h, q)*f;
dLfh = jacobian(Lfh, q);

Lgh = jacobian(h, q)*g;
dLgh = jacobian(Lgh, q);

LfLfh = jacobian(Lfh, q)*f;
dLfLfh = jacobian(LfLfh, q);

LfLgh = jacobian(Lgh, q)*f;
dLfLgh = jacobian(LfLgh, q);

LgLfh = jacobian(Lfh, q)*g;
dLgLfh = jacobian(LgLfh, q);

% se rank(delta) = 4 il sistema è localmente osservabile (Theorem 7).
dO = [dh; dLfh; dLgh; dLfLfh; dLgLfh; dLfLgh];
rank(dO)

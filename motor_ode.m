function dx = motor_ode(t,x,Ra,La,Kb,Kt,JW,zetaW,Vamp)

    i = x(1);
    omega = x(2);

    % Pulse 5 detik (1 s - 6 s)
    if t < 1
        V = 0;
    elseif t < 6
        V = Vamp;
    else
        V = 0;
    end

    % Persamaan (2) + dinamika mekanik
    di = (V - Ra*i - Kb*omega) / La;
    domega = (Kt*i - zetaW*omega) / JW;

    dx = [di; domega];
end

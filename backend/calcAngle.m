function theta = calcAngle(a,b,c,d)

    % Make corrections for screen offset
    rect = Screen('Rect',0);
    a = a - (rect(3)/2);
    c = c - (rect(3)/2);
    b = b - (rect(4)/2);
    d = d - (rect(4)/2);
    
    % Perform calculations
    ac = a * c;
    bd = b * d;
    num = ac + bd;
    
    a_denom = sqrt(a^2 + b^2);
    b_denom = sqrt(c^2 + d^2);
    denom = a_denom * b_denom;
    
    radians = acos(num/denom);
    
    theta = radians * (180/pi);
    
end
function [ gain ] = Gain( test, examples, targets )

    p_0 = 0;
    p_1 = 0;
    n_0 = 0;
    n_1 = 0;
    p = 0;
    n = 0;
    [rows, ~] = size( examples );
            
    for i = 1:rows
        if examples( i, test ) == 0
            if targets(i,1) == 0
                n_0 = n_0 + 1;
                n = n + 1;
            else
                p_0 = p_0 + 1;
                p = p + 1;
            end
        else
            if targets(i,1) == 0
                n_1 = n_1 + 1;
                n = n + 1;
            else
                p_1 = p_1 + 1;
                p = p + 1;
            end
        end
    end
    
    i_gain = IGain( p, n );
    
    remainder = ((p_0 + n_0)/(p+n))*IGain(p_0,n_0) + ((p_1 + n_1)/(p+n))*IGain(p_1,n_1);
    
    gain = i_gain - remainder;
    return
end


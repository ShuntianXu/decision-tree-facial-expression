function [ g ] = IGain( p, n )

    if( p == 0 || n == 0 )
        g = 0;
        return
    end

    g = -(p/(p+n))*log2(p/(p+n)) - (n/(p+n))*log2(n/(p+n));
    return
end


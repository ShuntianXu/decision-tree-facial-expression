function [ subbed ] = SubAttribute( attributes, best_attribute )

    attlen = length( attributes );
    subbed = zeros( 1, attlen - 1 );
    if( ( attlen - 1 ) == 0 )
        return
    end
    n = 1;
    
    for i = 1:attlen
        if attributes(1,i) ~= best_attribute
            subbed(1,n) = attributes(1,i);
            n = n + 1;
        end
    end
    
    return
end


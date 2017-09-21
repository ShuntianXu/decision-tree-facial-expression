function [ prediction, depth ] = ExploreTree( data, tree, d )

    op = tree.op;
    kids = tree.kids;
    class = tree.class;
    [~,len] = size( kids );
    
    if( ~isempty( class ) )
        prediction = class;
        depth = d;
        return
    end
    
    if( data(op) == 0 || len == 1 ) 
        [ prediction, depth ] = ExploreTree( data, kids{1}, d+1 );
    else
        [ prediction, depth ] = ExploreTree( data, kids{2}, d+1 );
    end
        
end


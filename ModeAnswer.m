function [ val ] = ModeAnswer( tree )

    kids = tree.kids;
    class = tree.class;
    [~,len] = size( kids );
    
    if( ~isempty( class ) )
        val = ( class );
        return
    end
    
    val = [];
    for i = 1:len
        val = [ ModeAnswer( kids{i} ), val ];
    end

end


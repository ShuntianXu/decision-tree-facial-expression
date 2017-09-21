function [ predictions ] = testTrees( T, x2 )

    random = 0;

    [~,T_len] = size(T);
    [x_rows,~] = size(x2);
    predictions = zeros(x_rows,1);
    
    for i = 1:x_rows
        pred = zeros(2,T_len);
        for k = 1:T_len
            [ pred(1,k), pred(2,k) ] = ExploreTree( x2(i,:), T{k}, 0 );
        end
        
        if random == 1
            [val,~] = max(pred(1,:));
            I = find(pred(1,:)==val);
            predictions(i,1) = I(randi(length(I)));
        else
            [val,~] = max(pred(1,:));
            I = find(pred(1,:)==val);
            depths = [I; pred(2,[I])];
            val2 = 0;

            if val == 1
                [val2,~] = min(depths(2,:));    
            else
                [val2,~] = max(depths(2,:));
            end

            I2 = find(depths(2,:)==val2);       
            predictions(i,1) = depths(1,I2(randi(length(I2))));
        end
    end       

end


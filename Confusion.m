function [ confusion, recall, precision, f1, cr ] = Confusion( x, y, normalize )

    [rows, ~] = size( x );
    split_size = floor( rows/10 );
    confusion = zeros(6,6);
    
    for i = 1:split_size:( rows - split_size )
        validation_set = x(i:i+split_size-1,:);
        validation_set_test = y(i:i+split_size-1,:);
        training_set = [x(1:(i-1),:); x(i+split_size:rows,:)];
        training_set_test = [y(1:(i-1),:); y(i+split_size:rows,:)];
        trees = {[]};
        
        for k = 1:6
            trees{k} = CreateTree( k, training_set, training_set_test, 0 );
        end
        
        predictions = testTrees( trees, validation_set );
        for v = 1:split_size
            real = validation_set_test(v,1);
            predicted = predictions(v,1);
            
            confusion(real,predicted) = confusion(real,predicted) + 1;
        end
    end
    
    if normalize == 1
        confusion = Normalize( confusion );
    end
    
    for k = 1:6
        TP = confusion(k,k);
        FP = sum( confusion(:,k) ) - TP;
        FN = sum( confusion(k,:) ) - TP;
        TN = sum( sum( confusion ) ) - TP - FP - FN;
        
        recall(k) = (TP/(TP + FN)) * 100;
        precision(k) = (TP/(TP + FP)) * 100;
        f1(k) = 2 * ( ( precision(k) * recall(k) ) / ( precision(k) + recall(k) ) );
    end
    
    cr = ( trace(confusion) / sum( sum( confusion ) ) ) * 100;
    
end
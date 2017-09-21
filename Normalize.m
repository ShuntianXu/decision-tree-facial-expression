function [ norm ] = Normalize( confusion )

    for k = 1:6
        true_examples = sum( confusion(k,:) );
        norm(k,:) = confusion(k,:) / true_examples;
    end

end


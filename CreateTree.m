function [tree] = CreateTree( tval, examples, targets, draw )

    [~,w] = size(examples);
    attributes = 1:w;

    for i = 1:length(targets)
        if targets(i) == tval
            targets(i) = 1;
        else
            targets(i) = 0;
        end
    end

    tree = DecisionTreeLearning( examples, attributes, targets );

    if draw == 1
        DrawDecisionTree( tree, emolab2str( tval ) );
    end
end
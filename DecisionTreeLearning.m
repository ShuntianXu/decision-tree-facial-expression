function [ tree ] = DecisionTreeLearning( examples, attributes, targets )

    if range( targets ) == 0
        tree = struct( 'op', [], 'kids', {[]}, 'class', targets(1) );
        return
    elseif isempty( attributes )
        tree = struct( 'op', [], 'kids', {[]}, 'class', MajorityValue( targets ) );
        return
    else
        best_attribute = ChooseBestDecisionAttribute( examples, attributes, targets );
        tree = struct( 'op', best_attribute, 'kids', {[]}, 'class', [] );

        for u = 0:1
            tree.kids{u+1} = struct( 'op', u, 'kids', {[]}, 'class', [] );
            examples_u = [];
            targets_u = [];
            n = 1;
            [rows, ~] = size( examples );
            
            for i = 1:rows
                if examples(i,best_attribute) == u
                    examples_u(n,:) = examples(i,:);
                    targets_u(n,1) = targets(i,1);
                    n = n + 1;
                end
            end

            if isempty( examples_u )
                tree.kids{u+1} = struct( 'op', [], 'kids', {[]}, 'class', MajorityValue(targets) );
                return
            else
                attributes_u = SubAttribute( attributes, best_attribute );
                tree.kids{u+1} = DecisionTreeLearning( examples_u, attributes_u, targets_u );
            end
        end
        return
    end
end

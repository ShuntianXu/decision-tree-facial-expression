function [ loc ] = ChooseBestDecisionAttribute( examples, attributes, targets )

    max = -1;
    loc = 0;

    for i=1:length( attributes )
        gain = Gain( attributes(i), examples, targets );
        if gain > max
            loc = attributes(i);
            max = gain;
        end
    end
    
    return
end


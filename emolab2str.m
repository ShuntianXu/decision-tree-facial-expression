function a = emolab2str(b)
switch b
    case 1
          a = 'anger';
    case 2
        a = 'disgust';
    case 3
        a = 'fear';
    case 4
        a = 'happiness';
    case 5
        a = 'sadness';
    case 6
        a = 'surprise';
    otherwise
        error('Unknown emotion label: %d',b);
end
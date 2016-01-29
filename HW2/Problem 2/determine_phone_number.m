% Determine phone number from 7 given audio files
% Answer is: 494-0412
function number = determine_phone_number()
    % 7 Files
    files = ['DtmfA.ogg'; 'DtmfB.ogg'; 'DtmfC.ogg'; 'DtmfD.ogg'; 'DtmfE.ogg'; 'DtmfF.ogg'; 'DtmfG.ogg'];
    
    % Allocate array of numbers to return
    number = zeros(1,7);
    
    % Loop each file to get digits
    for i = 1:7
        % Get phone digit from file
        number(i) = get_number(files(i,:));
    end
end
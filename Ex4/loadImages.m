function imgs=loadImages(directoryPath) %
    % Read all images from directoryPath %
    % Arguments:
    % directoryPath ? A string with the directory path %
    % Returns
    % imgs ? 4 dimensional vector, where imgs(:,:,:,k) is the k?th
    % image in RGB format. %
    directory= dir(directoryPath);
    numFiles =numel(directory)-2;
    imgs =zeros([size(imread(strcat(directoryPath,'/',directory(3).name))), numFiles]);
    for i=1:numFiles
        imgs(:,:,:,i)=im2double(imread(strcat(directoryPath,'/',directory(i+2).name)));
    end
end
    
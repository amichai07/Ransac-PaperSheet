function [pyr, filter] = GaussianPyramid(im, maxLevels, filterSize)

filter=createFilter(filterSize);
pyr =cell(maxLevels,1);
    pyr{1}=im;
    i=2;
    while i<=maxLevels && size(pyr{i-1},1)>16 && size(pyr{i-1},2)>16
        pyr{i}= conv2(pyr{i-1},filter,'same');
        pyr{i} = pyr{i}(:,1:2:size(pyr{i},2));
        pyr{i} =conv2( pyr{i},filter','same');
        pyr{i} = pyr{i}(1:2:size(pyr{i},1),:);
%         imshow(pyr{i});
        i=i+1;
    end    
     emptyCells = cellfun('isempty', pyr); 
     pyr(all(emptyCells,2),:) = [];
end


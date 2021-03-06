function [ind1,ind2] = myMatchFeatures(desc1,desc2,minScore)
% MYMATCHFEATURES Match feature descriptors in desc1 and desc2.
% Arguments:
% desc1   A kxkxn1 feature descriptor matrix.
% desc2   A kxkxn2 feature descriptor matrix.
% minScore   Minimal match score between two descriptors required to be
% regarded as matching.
% Returns:
% ind1,ind2   These are m entry arrays of match indices in desc1 and desc2. %
% Note:
% 1. The descriptors of the ith match are desc1(ind1(i)) and desc2(ind2(i)).
% 2. The number of feature descriptors n1 generally di?ers from n2
% 3. ind1 and ind2 have the same length.
counter =1;
ind1 ,ind2 =zeros(size(desc1,3));
newDesc1 =reshape(desc1,size(desc1,1)*size(desc1,2),1);
newDesc2 =reshape(desc2,size(desc2,1)*size(desc2,2),1)';
crossCorMat = newDesc1*newDesc2;
[maxCols, indexes] =max(crossCorMat);
for i=1:size(desc2,1)*size(desc2,2)
    if maxCols(i) = max(crossCorMat(i,:))
        %add it to match
        ind1[counter] =i;
        ind2[counter] =indexes(i);
        counter =counter+1;
    end
    
end
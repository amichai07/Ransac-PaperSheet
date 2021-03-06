function [T,inliers] = ransacTransform(pos1,pos2,numIters,inlierTol)
% Fit transform to maximal inliers given point matches
% using the RANSAC algorithm. %
% Arguments:
% pos1,pos2   Two nx2 matrices containing n rows of [x,y] coordinates of
% matched points.
% numIters   Number of RANSAC iterations to perform.
% inlierTol   inlier tolerance threshold. When determining if a given match,
% e.g. between pos1(i,:) and pos2(i,:), is an inlier match, the squared euclidean
% distance between the transformed pos1(i,:) and pos2(i,:) is computed and
% compared to inlierTol. Matches having this squared distance smaller than
% inlierTol are treated as inliers. %
% Returns:
% T   A 3x3 matrix, where T(1,3) is dX and T(2,3) is dY.
% inliers   An array containing the indices in pos1/pos2 of the maximal set of
% inlier matches found. %
% Description:
% To determine if a given match, e.g. between pos1(i,:) and pos2(i,:), is an
% inlier match, the squared euclidean distance between the transformed pos1(i,:)
% and pos2(i,:) is computed and compared to inlierTol. Matches having this squared
% distance smaller than inlierTol are deemed inliers.
inliers =0;
randControl =zeros(size(pos1,1),1);
for i=1:numIters
    randIter=randi(size(pos1,1),1);
    if randControl(randIter)>0;
        continue;
    else
        randControl(randIter) =1;
        Iinleirs =findInleirs(pos1,pos2,randIter,inlierTol);
        if sum(Iinleirs)>sum(inliers)
            inliers =Iinleirs;
        end
    end
end
   
end


inleirs =function findInleirs(pos1,pos2,index,inlierTol)
    numInleirs =1;
    shift =pos1(index)-pos2(index);
    inleirs= abs(pos1 -shift-pos2)<inlierTol;
    
end    
    
    
    
    


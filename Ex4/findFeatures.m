function [pos,desc] = findFeatures(pyr,maxNum)
% FINDFEATURES Detect feature points in pyramid and sample their descriptors. % Arguments:
% pyr ? Gaussian pyramid of a grayscale image having at least 3 levels.
% maxNum ? Sets the maximal number of feature points to detect.
% Returns:
% pos ? An nx2 matrix of [x,y] feature positions per row found in pyr. These
% coordinates are provided at the pyramid level pyr{1}.
% desc ? A kxkxn feature descriptor matrix.
pos =spreadOutCorners(pyr{1},7,7,maxNum); %TODO
newPos= zeros(size(pos));
  for i=1:size(pos,1);
        newPos(i,:) =pointToPyr(pos(i,:),1,3);
        newPos(i,:)=newPos(i,:)*checkPos(newPos(i,:),3,size(pyr{3}));
  end
  pos(newPos(:,1)==0,:)=[];
  newPos(newPos(:,1)==0,:)=[];
  desc=sampleDescriptor(pyr{3},newPos,3);
end


function pointInPyr =pointToPyr(point, levelIn ,levelOut)
 pointInPyr =(2^(levelIn-levelOut))*(point-1);

end


function validPoint =checkPos(point, descRad,sizeOfIm)
    binPass1 =(point-descRad)>0;
    binPass1 =binPass1(1)*binPass1(2);
    binPass2 = (point+descRad)< sizeOfIm;
    validPoint = binPass1*binPass2(1)*binPass2(2);
end
function checkRansac(im1,im2)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
pyr1 =GaussianPyramid(im1,3,5);
pyr2 =GaussianPyramid(im2,3,5);

 [pos1 desc1]= findFeatures(pyr1,800);
 [pos2 desc2] =findFeatures(pyr2,800);
 [ind1,ind2] =myMatchFeatures(desc1,desc2,1);
 pos1 =pos1(ind1,:);
 pos2 =pos2(ind2,:);
inlind =ransacTransform(pos1,pos2,10,10);%num of iteration ,tolarance
displayTheMatches(im1,im2,pos1,pos2);



end


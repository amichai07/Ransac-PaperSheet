function displayTheMatches(im1,im2,pos1,pos2,inlind)
% DISPLAYMATCHES Display matched pt. pairs overlayed on given image pair. % Arguments:
% im1,im2   two grayscale images
% pos1,pos2   nx2 matrices containing n rows of [x,y] coordinates of matched
% points in im1 and im2 (i.e. the i?th match?s coordinate is
% pos1(i,:) in im1 and and pos2(i,:) in im2).
% inlind   k element array of inlier matches (e.g. see output of
% ransacHomography.m)
twoPic =[im1,im2];
pos2=pos2+size(im1,1);
imshow(twoPic);
hold on;
plot([pos1 pos2],'*r');
outliers =1:size(pos1,1);
outliers(inlind)=[];
plot([pos1(inliers,1),pos2(inliers,1)],[pos1(inliers,2),pos2(inliers,2)],'y');
plot([pos1(inliers,1),pos2(inliers,1)],[pos1(inliers,2),pos2(inliers,2)],'b');

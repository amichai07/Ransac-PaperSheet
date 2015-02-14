function desc = sampleDescriptor(im,pos,descRad)
    % SAMPLEDESCRIPTOR Sample a MOPS?like descriptor at given position in image. % Arguments:
    % im ? nxm grayscale image to sample within.
    % pos ? A nx2 matrix of [x,y] descriptor positions in im.
    % descRad ? ?Radius? of descriptors to compute (see below).
    % Returns:
    % desc ? A kxkxn 3?d matrix containing the ith descriptor
    % at desc(:,:,i). The per?descriptor dimensions kxk are related to the
    % descRad argument as follows k = 1+2?descRad.
  
    desc= zeros(descRad,descRad,size(pos,1));
    for i=1:size(pos,1);
       desc(:,:,i) =im(newPos(1)-descRad:newPos(1)+descRad,newPos(2)-descRad:newPos(2)+descRad);
    end
end 



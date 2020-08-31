function [theta, index, F, T] = GenImages(images)
    %Problème pour rand(1) == 1 mais improbable
    index = floor(rand(1)*size(images, 3))+1;
    F = images(:,:,index);
    theta = rand(1)*360;
    T = MyRotate(theta, F, F);
end
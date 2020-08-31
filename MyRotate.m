function [ ImRotated ] = MyRotate( theta, ImMoving, ImFixed )
%MyRotate Summary of this function goes here
%   Implement interpolation (nearest neighbors) for rotating an image
%   around the center of the image 
%   inputs : theta (angle), ImFixed (reference image for resampling)
%             ImMoving (image to be deformed)
%   output : ImRotated
%   Procedure: for resampling the image the idea is to browse the
%   Destination image, and then looking into the ImMoving the
%   correspondences
%   oscar.acosta@univ-rennes1.fr


  ImRotated = zeros (size(ImFixed));
  M=size(ImRotated,2); %No cols
  N=size(ImRotated,1);  % No rows
  %  We use the inverse Matrix, as we are filling into the Rotated Image
  th=theta*pi/180;
  T=[cos(th) sin(th) 0; 
      -sin(th) cos(th) 0;];
  % we stock cx and cy center of the image
  cx=M/2;
  cy=N/2;
  
  for i=1:M
    for j=1:N
        
        x=i-cx;
        y=j-cy;
        U=T*[x y,1]';
        posx=floor(U(1)+cx);
        posy=floor(U(2)+cy);
        if (posx <= M ) && ( posy <= N ) && (posx >0 ) && (posy > 0)
            ImRotated(j,i)=ImMoving(posy,posx);           
        else
            ImRotated(j,i)=0;
        end
        
    end
  end
  

end


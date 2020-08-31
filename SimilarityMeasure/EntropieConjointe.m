classdef EntropieConjointe < Measure
    methods
        function obj = measure(obj, image1, image2)
            Pxy = EntropieConjointe.PXY(image1, image2);
            U = Pxy.*log2(Pxy);
            obj.result = -sum(U(~isnan(U)));
        end
    end
    methods(Static)
        function [Pxy] = PXY(image1, image2)
            [n,m] = size(image1);
            Pxy = zeros(256, 256);
            for x = 1:n
                for y = 1:m
                    idx1 = image1(x,y)+1;
                    idx2 = image2(x,y)+1;
                    Pxy(idx1, idx2) = Pxy(idx1, idx2)+1;
                end
            end
            Pxy = Pxy/(m*n);
        end
    end
end


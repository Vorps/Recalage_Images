classdef InformationMutuelle < Measure
    methods
        function obj = measure(obj, image1, image2)
            obj.result = InformationMutuelle.Entropie(image1)...
            +InformationMutuelle.Entropie(image2)...
            - EntropieConjointe().measure(image1, image2).result;
        end
    end
    methods(Static)
        function result = Entropie(image)
            P = InformationMutuelle.PX(image);
            U = P(1, :) .*log2(P(1, :));
            result = -sum(U(~isnan(U)));
        end

        function [P] = PX(image)
            [n,m] = size(image);
            P = zeros(1, 256);
            for i = 0:255
              P(1,i+1) = sum(sum(image == i))./(n*m);
            end
        end
    end
end

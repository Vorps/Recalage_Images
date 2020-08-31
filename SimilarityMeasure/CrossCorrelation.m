classdef CrossCorrelation < Measure
    methods
        function obj = measure(obj, image1, image2)
            mu1 = mean(mean(image1));
            mu2 = mean(mean(image1));
            obj.result = (1-sum(sum((image1-mu1).*(image2-mu2)))...
            /(sqrt(sum(sum((image1-mu1).^2))*sum(sum((image2-mu2).^2)))))^2;
        end
    end

end

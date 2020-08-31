classdef OptimizationRotationGradient < Optimization
    
    methods
        function obj = OptimizationRotationGradient(func, realValue)
            obj = obj@Optimization(func, realValue);
        end

        function obj = measure(obj, image1, image2)
            rot = 1:360;
            coutPass = zeros(length(rot), 1);
            for i = 1:length(rot)
                coutPass(i) = obj.func.measure(image1, MyRotate(rot(i), image2, image2)).result;
            end
            [~, I] = min(coutPass);
            obj.complexity = length(rot);
            x(1) =  double(rot(I-1));
            y(1) =  double(coutPass(I-1));
            x(2) =  double(rot(I));
            y(2) =  double(coutPass(I));
            i = 3;
            while 1
                dy = (y(i-1)-y(i-2))/abs(x(i-1)-x(i-2));
                x(i) = x(i-1)+0.2*dy;
                if(abs(x(i)-x(i-1)) < 0.0001)
                        x(i) = x(i) + 0.001;
                end
                y(i) = obj.func.measure(image1, MyRotate(x(i), image2, image2)).result;

                
                obj.complexity = obj.complexity+1;
                if((sum(sum(image1 == MyRotate(x(i), image2, image2))) == size(image1,1)*size(image1,2)))
                    obj.value = x(end);
                    break;
                end
                i = i+1;
            end
        end

        function show(obj)
            disp(['Complexité : ',num2str(obj.complexity),' Rotation estimé : ', num2str(obj.value), ' degrées , Erreur d estimation : ', num2str(abs(obj.value-obj.realValue))])
        end
    end
end


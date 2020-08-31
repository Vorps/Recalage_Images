classdef OptimizationRotation < Optimization
    
    methods
        function obj = OptimizationRotation(func, realValue)
            obj = obj@Optimization(func, realValue);
        end

        function obj = measure(obj, image1, image2)
            rot = 0:30:360-30;
            pass = 1;
            while 1
                coutPass = zeros(length(rot), 1);
                for i = 1:length(rot)
                    coutPass(i) = obj.func.measure(image1, MyRotate(rot(i), image2, image2)).result;
                end
                obj.cout{pass,1} = coutPass;
                obj.cout{pass, 2} = rot;
                [~, I] = min(coutPass);
                obj.value{pass} = rot(I);
                start = I-1;
                stop = I+1;
                if(start < 0)
                    start = 0;
                end
                if(stop > length(rot))
                    stop = length(rot);
                end

                c = 0;
                if(pass > 1)
                    c = obj.complexity(pass-1);
                end
                obj.complexity(pass) = c+i;
                if((sum(sum(image1 == MyRotate(rot(I), image2, image2))) == size(image1,1)*size(image1,2)))
                    break;
                end
                pas = 10/10^pass;
                rot = rot(start):pas:rot(stop);
                pass = pass +1
            end
        end

        function show(obj)
            for i = 1:length(obj.cout)
                figure;
                hold on
                [M, I] = min(obj.cout{i,1});
                plot(obj.cout{i,2}, obj.cout{i,1});                
                cout = obj.cout{i, 2};
                plot(cout(I), M, '+r')
                legend(['Complexité ', num2str(obj.complexity(i))])
                title(['Pass', num2str(i) ,', Rotation estimé : ', num2str(obj.value{i}), ' degrées , Erreur d estimation : ', num2str(abs(obj.value{i}-obj.realValue))])
                hold off
            end
        end
    end
end


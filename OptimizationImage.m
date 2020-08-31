classdef OptimizationImage < Optimization
    methods
        function obj = OptimizationImage(func, realValue)
             obj = obj@Optimization(func, realValue);
        end

        function obj = measure(obj, image, images)
            obj.cout = zeros(size(images, 3), 1);
            for i = 1:size(images, 3)
                obj.cout(i) = obj.func.measure(image, images(:,:,i)).result;
            end
            obj.complexity = i;
            [~, I] = min(obj.cout);
            obj.value = I;
        end

        function show(obj, labels)
            [M, I] = min(obj.cout);
            figure;
            hold on
            plot(obj.cout);
            plot(I, M, '+r')
            legend(['Complexité ', num2str(obj.complexity)])
            title(['Image estimée : ', labels{obj.value}, ', Image réelle : ', labels{obj.realValue}])
            hold off
        end
    end
end


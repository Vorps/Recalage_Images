classdef Matrice < Show
    properties
        images;
        matrix;
        func;
    end
    methods
        function obj = Matrice(images, func)
            obj.images = images;
            obj.func = func;
            s = size(images, 3);
            obj.matrix = zeros(s, s);
            [X, Y] = meshgrid(1:s, 1:s);
            cart = [X(:), Y(:)];
            for x = cart'
                obj.matrix(x(1),x(2)) =  func.measure(images(:,:, x(1)), images(:,:, x(2))).result;
            end
        end
        function show(obj)
            figure;
            heatmap(obj.matrix);
            title(['Matrice ', class(obj.func)])
        end
    end
end


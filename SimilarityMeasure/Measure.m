classdef Measure
    properties
      result;
    end
    methods(Abstract)
        measure(image1, image2)
    end
end
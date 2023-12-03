classdef ValidationBench  
    properties
        matches
        missdetections
        errors
    end
    
    methods
        function obj = ValidationBench()
            obj.matches = 0;
            obj.missdetections = 0;
            obj.errors = 0;
        end
        
        function obj = publishNoDetection(obj, scene, info)
            if scene.isValid
                obj.errors = obj.errors + 1;
                disp(strjoin(["Error:" info "(" scene.path ")"]));
            else
                disp(strjoin(["Detection: invalid picture!" "(" scene.path ")"]));
                obj.matches = obj.matches + 1;
            end
        end
        
        function obj = publishDetection(obj, scene, number, probability)
            match = (number == str2num(scene.velocity));
        
            if match
                disp(strjoin(["Detection:" match "probability:" probability "(detect:" number "orig:" scene.velocity ")" "(" scene.path ")"]));
                obj.matches = obj.matches + 1;
            else
                disp(strjoin(["Error:" info "probability:" probability "(detect:" number "orig:" scene.velocity ")" "(" scene.path ")"]));
                obj.errors = obj.errors + 1;
            end
        end

        function obj = printResult(obj)
            NUM_OF_TRIES = obj.matches + obj.missdetections + obj.errors;
            disp("--------------------------------------------");
            disp(strjoin(["Final detection rate: " obj.matches / NUM_OF_TRIES * 100 "%"]));
            disp(strjoin(["Final missdetection rate: " obj.missdetections / NUM_OF_TRIES * 100 "%"]));
            disp(strjoin(["Final error rate: " obj.errors / NUM_OF_TRIES * 100 "%"]));
            disp("--------------------------------------------");
        end
    end
end


classdef element < handle
    %
    %   Class:
    %   xml.element
    
    properties
        h
    end
    
  	properties (Dependent)
        name
        n_children
        n_attributes
        attributes
    end
    
  	methods
        function value = get.name(obj)
            
        end
        function value = get.n_children(obj)
            if obj.h.hasChildNodes
                c = obj.h.getChildNodes();
                value = c.getLength();
            else
                value = 0; 
            end
        end
        function value = get.n_attributes(obj)
            if obj.h.hasAttributes
                c = obj.h.getAttributes();
                value = c.getLength();
            else
                value = 0; 
            end
        end
        function value = get.attributes(obj)
            value = h__parseAttributes(obj);
        end
    end
    
    methods
        function obj = element(h)
            %
            %   obj = xml.element(h)
            
            obj.h = h;
        end
    end
end

function attributes = h__parseAttributes(theNode)
    % Create attributes structure.
    
    %TODO: Replace with mex struct assignment ...

    attributes = struct;
    if hasAttributes(theNode)
       theAttributes = getAttributes(theNode);
       numAttributes = getLength(theAttributes);

       for count = 1:numAttributes
            %attrib = item(theAttributes,count-1);
            %attr_name = regexprep(char(getName(attrib)),'[-:.]','_');
            %attributes.(attr_name) = char(getValue(attrib));

            %Suggestion of Adrian Wanner
            str = toCharArray(toString(item(theAttributes,count-1)))';
            k = strfind(str,'='); 
            attr_name = str(1:(k(1)-1));
            attr_name = strrep(attr_name, '-', '_dash_');
            attr_name = strrep(attr_name, ':', '_colon_');
            attr_name = strrep(attr_name, '.', '_dot_');
            attributes.(attr_name) = str((k(1)+2):(end-1));
       end
    end
end
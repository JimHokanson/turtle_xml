classdef document < handle
    %
    %   Class:
    %   xml.document
    
    %{
        fp = 'C:\Users\RNEL\Desktop\temp_xml\data.xml';
        o = xml.document(fp);
        o.getChild(1);
    %}
    
    properties
        h
        file_path
    end
    
    properties (Dependent)
        n_children
        n_attributes
    end
    
    methods
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
    end
    
    methods
        function obj = document(file_path)
            obj.h = xmlread(file_path);
            obj.file_path = file_path;
        end
        function c = getChild(obj,index)
            c1 = obj.h.getChildNodes();
            c2 = c1.item(index-1);
            
            %??? How to tell if an element or not?
            
            c = xml.element(c2);

        end
    end
end


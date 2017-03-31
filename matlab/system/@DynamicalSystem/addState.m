function obj = addState(obj, x, dx, ddx)
    % Add state variables of the dynamical system
    %
    % Parameters:
    %  x: the symbolic variables of the states @type SymVariable
    %  dx: the symbolic variables of the first order derivatives of
    %  states @type SymVariable
    %  ddx: the symbolic variables of the second order derivatives of
    %  states @type SymVariable
    
    assert(isa(x,'SymVariable') && isvector(x), ...
        '(x) must be a vector SymVariable object.');
    
    assert(isa(dx,'SymVariable') && isvector(x), ...
        '(dx) must be a vector SymVariable object.');
    obj.States.x = x;
    obj.States.dx = dx;
    
    obj.numState = length(obj.States.x);
    
    assert(length(obj.States.dx) == obj.numState,...
        'The dimension of (dx) is incorrect.');
    
    if nargin > 3
        if ~isempty(ddx)
            assert(isa(ddx,'SymVariable') && isvector(x), ...
                '(ddx) must be a vector SymVariable object.');
            obj.States.ddx = ddx;
            
            assert(length(obj.ddx) == obj.numState,...
                'The dimension of (dx) is incorrect.');
        end
    end
end

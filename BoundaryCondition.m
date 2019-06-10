function [C_out] = BoundaryCondition(n,C,C_add)
getvariables;
if (CONTINUOUS)
    if  n>=2
        C_out = C + C_add;
    else
        C_out = C;
    end
else
    C_out = C;
end
end
function [C_face_x,C_face_z] = C_face(C)
makegrid;
C_face_z = zeros(Ni,Nj+1);
C_face_x = zeros(Ni+1,Nj);

C_face_z(:,1:(end-1)) = C;
C_face_z(:,end) = 0;
C_face_x(2:end,:) = C;
C_face_x(1,:) = 0;
end
function NED = GXYZ2NED(Pc, LLH)
%   XYZ2NED dX, dY, dZ (Cartesian) to dN, dE, dD (North, East, Down). 
%   Converts delta quantities dX, dY and dZ (Cartesian) into
%   dN, dE, dD (North, East, Down):
%
%   ned = xyz2ned_4th(dxyz,usrpl)
%   usrpl is a vector wtih Lattitude and Longitude of the point.

    phi = LLH(:,1);
    lambda = LLH(:,2);
    sinphi = sin(phi);
	cosphi = cos(phi);
	coslambda = cos(lambda);
	sinlambda = sin(lambda);
    
    N =(-sinphi.*coslambda).*Pc(:,1)-sinphi.*sinlambda.*Pc(:,2)+cosphi.*Pc(:,3);
    E =-sinlambda.*Pc(:,1)+coslambda.*Pc(:,2);
    D =-cosphi.*coslambda.*Pc(:,1)-cosphi.*sinlambda.*Pc(:,2)-sinphi.*Pc(:,3);
    NED = [N E D];


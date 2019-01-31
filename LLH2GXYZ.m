function GXYZ = LLH2GXYZ(LLH)  
%   usrxyz is output,usrplh is input,llh2xyz_4th is file name
%   LLH2XYZ  Convert from latitude, longitude and height
%   to ECEF cartesian coordinates.  WGS-84
%
%	xyz = LLH2XYZ(llh)	
%
%	usrplh(1) = latitude in radians
%	usrplh(2) = longitude in radians
%	usrplh(3) = height above ellipsoid in meters
%
%	xyz(1) = ECEF x-coordinate in meters
%	xyz(2) = ECEF y-coordinate in meters
%	xyz(3) = ECEF z-coordinate in meters

	phi = LLH(:,1);
	lambda = LLH(:,2);
	h = LLH(:,3);

	a = 6378137.0000;	% earth semimajor axis in meters
	b = 6356752.3142;	% earth semiminor axis in meters	
	e2 = (a^2-b^2)/(a^2); % e is first numerical eccentricity
    W  = sqrt(1.0-e2*((sin(phi)).^2));
    N  = a./W; % radius of curvature in the prime vertical 

    x=(N+h).*cos(phi).*cos(lambda);
    y=(N+h).*cos(phi).*sin(lambda);
    z=(N*(1-e2)+h).*sin(phi);

    GXYZ = [x y z];

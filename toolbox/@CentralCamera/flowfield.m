%CentralCamera.flowfield Optical flow
%
% C.flowfield(V) displays the optical flow pattern for a sparse grid
% of points when the camera has a spatial velocity V (6x1).
%
% See also QUIVER.


% Copyright (C) 1993-2017, by Peter I. Corke
%
% This file is part of The Machine Vision Toolbox for Matlab (MVTB).
% 
% MVTB is free software: you can redistribute it and/or modify
% it under the terms of the GNU Lesser General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
% 
% MVTB is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU Lesser General Public License for more details.
% 
% You should have received a copy of the GNU Leser General Public License
% along with MVTB.  If not, see <http://www.gnu.org/licenses/>.
%
% http://www.petercorke.com

function flowfield(cam, vel)
    a = 50:100:1000;
    [U,V] = meshgrid(a, a);
    du=[]; dv=[];
    for i=1:size(U,2)                      
        for j=1:size(U,2)                      
            pdot = cam.visjac_p( [U(i,j) V(i,j)], 2 ) * vel(:);
            du(i,j) = pdot(1); dv(i,j) = pdot(2);
        end
    end

    quiver(U, V, du, dv, 0.4)
    axis equal
        axis([1 cam.npix(1) 1 cam.npix(2)]);

    set(gca, 'Ydir', 'reverse');
    xlabel('u (pixels)');
    ylabel('v (pixels)');
    grid


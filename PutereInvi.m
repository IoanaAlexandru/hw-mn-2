function [valp vecp] = PutereInv(d, s, h, y, maxIter, tol)
	n = length(d);
	vecp = y;
	x = zeros(n, 1);
	while(maxIter)
		z = Thomas(s, d-h, s, y);
		vecp = z / norm(z);
		x(1) = d(1) * vecp(1) + s(1) * vecp(2);
		x(n) = d(n) * vecp(n) + s(n - 1) * vecp(n - 1);
		for i = 2 : n - 1
			rez(i) = s(i-1)*vecp(i-1) + d(i)*vecp(i) + s(i)*vecp(i+1);
		endfor
		valp = x' * vecp;
		h = valp;
		y = vecp;
		if norm(rez - valp * vecp ) < tol
			break;
		endif
		maxIter--;
	endwhile
endfunction
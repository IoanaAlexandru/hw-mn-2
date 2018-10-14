function [valp vecp] = PutereInv(d, s, h, y, maxIter, tol)
	n = length(d);
	x = zeros(1, n);
	for k = 2 : maxIter + 1
		x = Thomas(s, d - h, s, y);
		y = x / norm(x);
		x(1) = y(1) * d(1) + y(2) * s(1);
		x(n) = y(n - 1) * s(n - 1) + y(n) * d(n);
		for i = 2 : n - 1
			x(i) = y(i - 1) * s(i - 1) + y(i) * d(i) + y(i + 1) * s(i);
		endfor
		%x = A * y = y' * A
		h = x' * y;
		if norm(x - h * y) < tol
			break
		endif
	endfor
	vecp = y;
	valp = h;
endfunction
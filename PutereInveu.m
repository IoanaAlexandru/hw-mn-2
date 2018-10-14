function [valp vecp] = PutereInv(d, s, h, y, maxIter, tol)
	n = length(d);
	d1 = d;
	b = zeros(1, n);
	c = zeros(1, n);
	d = zeros(1, n);
	x = zeros(1, n);
	%MPI
	for k = 2 : maxIter + 1
		s = [0 s];
		b = d - h;
		%Thomas
		c(1) = s(1) / b(1);
		d(1) = y(1) / b(1);
		for i = 2 : n - 1
			c(i) = s(i) / (b(i) - c(i-1) * s(i));
			d(i) = (y(i) - d(i - 1) * s(i)) / (b(i) - c(i - 1) * s(i));
		endfor
		d(n) = (y(n) - d(n - 1) * s(n)) / (b(n) - c(n - 1) * s(n));
		x(n) = d(n);
		for i = n - 1 : 1
			x(i) = d(i) - c(i) * x(i + 1);
		endfor
		x = x';
		%/Thomas
		y = x / norm(x);
		x = zeros(1, n);
		s = s(2:n);
		x(1) = y(1) * d1(1) + y(2) * s(1);
		x(n) = y(n - 1) * s(n - 1) + y(n) * d1(n);
		for i = 2 : n - 1
			x(i) = y(i - 1) * s(i - 1) + y(i) * d1(i) + y(i + 1) * s(i);
		endfor
		%x = A * y = y' * A
		h = x * y;
		maxIter--;
		if (x - h * y) < tol
			break
		endif
	endfor
	vecp = y;
	valp = h;
endfunction
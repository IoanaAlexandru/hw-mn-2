function p = Bisectie(d, s, a, b, f, tol, n)
	p = a + (b - a) / 2;
	while abs(f(d, s, p)(n)) > tol && abs(b - a) > tol
		f(d, s, a)(n) * f(d, s, p)(n)
		(f(d, s, p)(n) * f(d, s, b)(n))
		if ((f(d, s, a)(n) * f(d, s, p)(n)) < 0)
			b = p
		elseif ((f(d, s, p)(n) * f(d, s, b)(n)) < 0)
			a = p
		else
			disp("EROARE");
		endif
		p = a + (b - a) / 2;
	endwhile
endfunction
function vp = CalculezValProprii(d, s, m, tol)
	r = IntervaleValProprii(d, s, m);
	for i = 1:length(r)-1
		a = r(i); b = r(i+1);
		p = a + (b - a) / 2;
		Pp = ValoriPolinoame(d, s, p); n = length(Pp);
		while (abs(b - a) > tol && abs(Pp(n)) > tol)
			Pa = ValoriPolinoame(d, s, a);
			Pb = ValoriPolinoame(d, s, b);
			if ((Pa(n) * Pp(n)) < 0)
				b = p;
			elseif ((Pp(n) * Pb(n)) < 0)
				a = p;
			endif
			p = a + (b - a) / 2;
			Pp = ValoriPolinoame(d, s, p);
		endwhile
		vp(i) = p;
	endfor
endfunction
function r = IntervaleValProprii(d, s, m)
	n = length(d);
	if (m > n)
		m = n;
	endif
	r = zeros(1, m + 2);
	[r(1) r(m + 2)] = LimiteValProprii(d, s);
	for k = m : -1 : 1
		mij = (r(k+2) + r(1))/2;
		h = r(k+2) - mij;
		numvp = NrValProprii(d, s, mij);
		do
			h = h/2;
			if (numvp < k)
				mij = mij + h;
			elseif (numvp > k)
				mij = mij - h;
			endif
			numvp = NrValProprii(d, s, mij);
		until (numvp == k)
		r(k+1) = mij;
	endfor
	r = r(1:m+1);
endfunction
function [limita_inf, limita_sup] = LimiteValProprii(d, s)
	n = length(d);
	t = zeros(1, n);
	t(1) = abs(s(1));
	t(n) = abs(s(n-1));
	t(2:n-1) = abs(s(1:n-2)) + abs(s(2:n-1));
	
	for i = 1:n
		inf(i) = d(i) - t(i);
		sup(i) = d(i) + t(i);
	endfor
	limita_inf = min(inf);
	limita_sup = max(sup);
	
	%limita_inf = min(d - t);
	%limita_sup = max(d + t);
	% ^ varianta vectorizată merge manual, dar nu merge în checker
endfunction
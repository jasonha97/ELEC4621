function [w, mag, phase] = custom_dft(x)

    % Frequency axis, normalised frequency axis:
    w = linspace(-pi, pi, 1024);
    
    % Use a for-loop to compute the FT:
    for k = 1:length(w)
       X(k) = 0;
       for n = 1:length(x)
          X(k) = X(k) + (x(n) * exp(-j*(k-1)*w(k))); 
       end
    end

    % Compute the magnitude spectrum
    mag = abs(X);
    
    % Compute the phase spectrum:
    phase = atan(imag(X) ./ real(X));
    
    
    
end


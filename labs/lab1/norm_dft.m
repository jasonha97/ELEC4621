function [omega, X_mag, phase_spec] = norm_dft(x, block_size)

    % Generate the x-axis comprising of the normalised frequencies from -pi
    % to pi
    omega = linspace(-pi, pi, block_size);

    % Let N be the length of the FFT (user-defined):
    N = block_size;
    
    % Need to compute the DFT by definition.
    for k = 1:length(omega)
       X(k) = 0;
       for n = 1:length(x)
           X(k) = X(k) + (x(n) * exp(-j*(k-1)*omega(n)));
       end
    end
    
    % Compute the amplitude spectra by taking the absolute value of the
    % complex valued X_mag:
    X_mag = abs(X);
    
    % Compute the phase spectrum by taking the arctan of the ratio of the
    % imaginary part of X to the real part.
    phase_spec = atan(imag(X)./real(X));
    
end


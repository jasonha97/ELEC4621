function X = my_dft(signal, n_freqs)

    % Let the input signal sequence be x. Transpose to column vector:
    x = transpose(signal);
    
    % Let N be the length of the input signal:
    N = length(signal);
    
    % Initialise an array for the output sequence equal to the length of
    % the frequency vector:
    X = zeros([N,1]);
    
    % Generate a frequency axis from -12000 to 12000 Hz in step-sizes
    % dependent on the variable 'n_freqs'
    f = linspace(-12000,12000,n_freqs)
    Nf = length(f);
    
    % For-loop to perform the DFT:
    for k = 1:Nf
       X(k) = 0;
       for n = 1:N
           complex_exp = exp(-j*2*pi*(n-1)*(k-1)/N);
           X(k) = X(k) + (x(n) .* complex_exp);
       end
    end
    
end


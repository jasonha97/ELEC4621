function rxx = my_autocorr(x)

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Function to compute the autocorrelation of a sequence x:
    %   Inputs: 
    %       - x: The input sequence
    %
    %   Outputs:
    %       - rxx: The computed autocorrelation.
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %  Start by declaring the length of the sequence, x as N:
    N = length(x);
    
    % Then, the final length of rxx, L MUST be 2N + 1:
    L = 2*N + 1;
    
    % Create a new sequence, xn, that is just x but zero-padded to match
    % the length of the autocorrelation sequence, rxx. Let the shifted
    % version of xn, x_sh also be the same size:
    xn = [x, zeros(1,L-N)];
    
    % Declare the autocorrelation vector, rxx of size 2N + 1:
    rxx = zeros(1,L);
    
    % Since the second sequence  in the summand of the discrete 
    % autocorrelation sum is the original sequence but shifted by an 
    % index, 'm' (corresponding to the index in the output sequence)
    % we can perform a circular shift to apply the appropriate shifts to
    % each sample in the original sequence.
    for m = 1:L
       % First apply the shift according to the lag m:
       xs = circshift(xn, m);
       
       % Then perform the inner product at the specific value of m:
       rxx(m) = sum(xn .* xs);
    end
    
    % We then need to divide by the length of the output vector of the
    % autocorrelation process:
    rxx = 1/L * rxx;
    
end


function [X_vecs, freq_vec, time_vec, C] = my_stft(x, frame_length, sampling_rate)

    % Let the length of the signal be L:
    L = length(x);

    % Let the frame length be F.
    F = frame_length;
    
    % Let Fs be the sampling rate:
    Fs = sampling_rate;
    
    % Compute the number of 'chunks' (frames) to be made. Let the number of
    % chunks be C:
    C = floor(length(x) / F);
    
    % Now we create a for-loop that moves along the signal and computes the
    % block-by-block FFT. Let 'i' represent the i-th block being computed.
    % The first block must be from samples 1:F.
     
    % Outer for-loop for block-by-block iteration
    for k = 1:C-1
        
        % Initialise a hanning window of length F. The window ensures
        % spectral leakage is minimised when the STFT is performed.
        w = hann(F);
        
        % Extract a portion of the signal based on the chunk index.
        x_part = x(1 + k*F: F + k*F);
        
        % Apply the Hannning window onto the partial chunk of the signal:
        x_part = x_part .* w;
        
        % Compute the FFT of the partial chunk and apply fftshift:
        X_part = abs(fftshift(fft(x_part, 2048)));
        
        % Only take single-sided portion of the spectrum.
        X_part_ss = X_part(length(X_part)/2 : length(X_part) - 1);
        
        % Store column vector 'X_part' into X_vecs at the i-th column.
        X_vecs(:, k) = X_part_ss;
        
    end
        
    % Need to produce a frequency-axis vector based on sampling_rate.
    freq_vec = linspace(0, L/2, 1024) * (Fs/L);
    
    % Need to produce the time-vector based on the sampling period.
    time_vec = linspace(0, (L-1)*(1/Fs), 1024);
    
    % Return all vectors to users at end of function
    C = C-1;
        
end


function [S, F, T] = p3spectrogram(x, window, noverlap, nsample, fs)

    %% spectrogram
    [S, F, T] = gen_spectrogram(x, window, noverlap, nsample, fs); % below
end

function [S, F, T] = gen_spectrogram(x, window, noverlap, nsample, fs)
    N = length(x);
    S = [];
    pos = 1;
    while (pos+nsample <= N)
        frame = x(pos:pos+nsample-1);
        pos = pos + (nsample - noverlap);
        Y = fft(frame .* window, nsample);
        % see also goertzel. signal/spectrogram.m is using it.
        S = [S Y(1:round(nsample/2), 1)]; % half is enough, another half is just mirror
    end
    [M, K] = size(S);
    F = (0:round(nsample/2)-1)' / nsample * fs; % [0, fs/2) Hz
    % F = psdfreqvec(nsample, fs, 'half');
    T = (round(nsample/2):(nsample-noverlap):N-1-round(nsample/2))/fs;
end

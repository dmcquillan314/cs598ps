function p3()
p3_1();
p3_2();
p3_3();
p3_4();
p3_5();
end

function p3_5()
    [x, fs] = audioread('49.mp3');
    
    figure;

    frame_length = 512;
    frame_overlap = frame_length / 2;
    window = hammingWindow(frame_length);
    
    M = 4;
    
    [S, F, T] = p3spectrogram(x(:), window, frame_overlap, frame_length, fs);
    SdB = 20 * log10(abs(S)); % dB
    subplot(3,1,1);
    a1 = imagesc(T, flipud(F), SdB);
    title('Original')
    xlabel('Time')
    ylabel('Frequency (Hz)')

    dec = p3decimate(x, M);
    [S, F, T] = p3spectrogram(dec(:), window, frame_overlap, frame_length, fs);
    SdB = 20 * log10(abs(S)); % dB
    subplot(3,1,2);
    a1 = imagesc(T, flipud(F), SdB);
    title('Decimated')
    xlabel('Time')
    ylabel('Frequency (Hz)')

    low_dec = p3filterlowpass(dec, M);
    [S, F, T] = p3spectrogram(low_dec(:), window, frame_overlap, frame_length, fs);
    SdB = 20 * log10(abs(S)); % dB
    subplot(3,1,3);
    a1 = imagesc(T, flipud(F), SdB);
    title('Filtered & Decimated')
    xlabel('Time')
    ylabel('Frequency (Hz)')

end

function p3_4()
    A = imread('46.jpg');
    
    figure;
    subplot(2,2,1);
    D_1 = p3gaussian(25, 1);
    circ_25_filter = uint8(convn(A,D_1));
    imshow(circ_25_filter);
        
    subplot(2,2,2);
    D_2 = p3gaussian(7, 0.3);
    circ_7_filter = uint8(convn(A,D_2));
    imshow(circ_7_filter);
        
    subplot(2,2,3);
    D_3 = double([ rot90(eye(20)) eye(20) ]);
    D_3 = D_3 ./ sum(sum(D_3));
    filter_3 = uint8(convn(A,D_3));
    imshow(filter_3);
    
    subplot(2,2,4);
    D_4 = ones(1,41)' .* ( 1 / 41 );
    filter_4 = uint8(convn(A,D_4));
    imshow(filter_4);

end

function p3_3()
    [x, fs] = audioread('39.wav');
    
    figure;

    frame_length = 512;
    frame_overlap = frame_length / 2;
    window = hammingWindow(frame_length);
    [S, F, T] = p3spectrogram(x(:), window, frame_overlap, frame_length, fs);
    SdB = 20 * log10(abs(S)); % dB
    subplot(3,2,1);
    a1 = imagesc(T, F, SdB);
    title('Original')
    xlabel('Time')
    ylabel('Frequency (Hz)')

    low_filter = fir1(48,0.48, 'low');
    low_filter_x = conv(x,low_filter);
    frame_length = 512;
    frame_overlap = frame_length / 2;
    window = hammingWindow(frame_length);
    [S, F, T] = p3spectrogram(low_filter_x(:), window, frame_overlap, frame_length, fs);
    SdB = 20 * log10(abs(S)); % dB
    subplot(3,2,2);
    a2 = imagesc(T, F, SdB);
    title('Lowpass')
    xlabel('Time')
    ylabel('Frequency (Hz)')
    
    high_filter = fir1(48,0.48, 'high');
    high_filter_x = conv(x,high_filter);
    frame_length = 512;
    frame_overlap = frame_length / 2;
    window = hammingWindow(frame_length);
    [S, F, T] = p3spectrogram(high_filter_x(:), window, frame_overlap, frame_length, fs);
    p3plotspectrogram(S, F, T); %, sprintf('%s window, N = %d', strjoin(frame_name), frame_length));
    SdB = 20 * log10(abs(S)); % dB
    subplot(3,2,3);
    a3 = imagesc(T, F, SdB);
    title('Highpass')
    xlabel('Time')
    ylabel('Frequency (Hz)')

    band_filter = fir1(48,[0.01 0.65]);
    band_filter_x = conv(x,band_filter);
    frame_length = 512;
    frame_overlap = frame_length / 2;
    window = hammingWindow(frame_length);
    [S, F, T] = p3spectrogram(band_filter_x(:), window, frame_overlap, frame_length, fs);
    p3plotspectrogram(S, F, T); %, sprintf('%s window, N = %d', strjoin(frame_name), frame_length));
    SdB = 20 * log10(abs(S)); % dB
    subplot(3,2,4);
    a4 = imagesc(T, F, SdB);
    title('Band-pass')
    xlabel('Time')
    ylabel('Frequency (Hz)')
    
    stop_filter = fir1(48,[0.35 0.65], 'stop');
    stop_filter_x = conv(x,stop_filter);
    frame_length = 512;
    frame_overlap = frame_length / 2;
    window = hammingWindow(frame_length);
    [S, F, T] = p3spectrogram(stop_filter_x(:), window, frame_overlap, frame_length, fs);
    p3plotspectrogram(S, F, T); %, sprintf('%s window, N = %d', strjoin(frame_name), frame_length));
    SdB = 20 * log10(abs(S)); % dB
    subplot(3,2,5);
    a5 = imagesc(T, F, SdB);
    title('Band-reject')
    xlabel('Time')
    ylabel('Frequency (Hz)')
end

function p3_2( )

[X, Y] = meshgrid(2*pi*(1:32)/32, 2*pi*(1:32)/32);

A = sin(3*X);
A_T = abs(p3computedft(A));
B = sin(5*Y);
B_T = abs(p3computedft(B));
C = sin(3*(X + Y));
C_T = abs(p3computedft(C));
D = sin(3*(X + Y)) + sin(6*X + 8*Y);
D_T = abs(p3computedft(D));

figure;
subplot(2,4,1);
imagesc(A);
colormap(flipud(bone))

subplot(2,4,2);
imagesc(A_T);
colormap(flipud(bone))

subplot(2,4,3);
imagesc(B);
colormap(flipud(bone))

subplot(2,4,4);
imagesc(B_T);
colormap(flipud(bone))

subplot(2,4,5);
imagesc(C);
colormap(flipud(bone))

subplot(2,4,6);
imagesc(C_T);
colormap(flipud(bone))

subplot(2,4,7);
imagesc(D);
colormap(flipud(bone))

subplot(2,4,8);
imagesc(D_T);
colormap(flipud(bone))

end

function p3_1() 
    [x, fs] = audioread('18.wav');
    
    figure;
    frame_lengths = [ 64 512 2048 ];
    frame_names = cellstr([ 'Small '; 'Medium'; 'Large ' ]);
    
    for j = 1:length(frame_lengths)
        frame_length  = frame_lengths(j);
        frame_overlap = frame_length / 2;
        frame_name = frame_names(j);
        window = hammingWindow(frame_length);
        [S, F, T] = p3spectrogram(x(:), window, frame_overlap, frame_length, fs);
        subplot(3,1,j);
        p3plotspectrogram(S, F, T, sprintf('%s window, N = %d', strjoin(frame_name), frame_length));
    end
end
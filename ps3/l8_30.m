function l8_30(  )

    [ d_pa, ~ ] = audioread('pa.wav');
    [ d_shot, ~ ] = audioread('shot.wav');
    
    dft_d_pa = fft(d_pa);
    
    dft_d_shot = fft(d_shot);
    
    convolution = abs(conv(dft_d_pa, dft_d_shot));
    smoothed = moving_average(convolution, 2000);
    normalized = smoothed ./ max(smoothed);
    figure;
    
    subplot(1,2,1);
    plot(d_pa);
    hold on;
    plot(normalized, '-');
    hold off;
end


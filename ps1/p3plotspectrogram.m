function p3plotspectrogram(S, F, T, title_tx)
    SdB = 20 * log10(abs(S)); % dB
    ax = imagesc(T, F, SdB);
    
    if nargin > 3
        title(title_tx);
    end
    
    set(get(ax, 'Parent'), 'YDir', 'normal');
    xlabel('Time')
    ylabel('Frequency (Hz)')
    % colorbar
end

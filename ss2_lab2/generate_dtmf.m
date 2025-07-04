function signal = generate_dtmf(digits)
    fs = 8000;
    tone_dur = 0.075;
    pause_dur = 0.030;

    row_freqs = [697, 770, 852, 941];
    col_freqs = [1209, 1336, 1477];

    dtmf_map = ['1','2','3';
                '4','5','6';
                '7','8','9';
                '*','0','#'];

    signal = [];

    for ch = digits
        [row, col] = find(dtmf_map == ch);
        if isempty(row), continue; end

        t = 0:1/fs:tone_dur;
        tone = sin(2*pi*row_freqs(row)*t) + sin(2*pi*col_freqs(col)*t);
        signal = [signal, tone, zeros(1, round(fs*pause_dur))];
    end
end

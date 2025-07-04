function ss2_problem_1(n) %part_a
    T = 0.0025; % resolution i.e data is collected every T seconds
    t = 0.0025 : T : 1;
    x =@(t) 4*sin(2 * pi * t) + cos((pi/4)+ (16 * pi * t));
    T_s = T * n; %sampling frequency 
    x_values = x(t); % avoids the original signal being altered to reduce errors

    % downsampling is Ex: data collected 0.0025,0.0050, 0.0075, 0.0100,
    % 0.0125,0.0150 etc. when n = 4, data is now collected every 4 steps
    % Ex: 0.0025,0.0100 and so on.
    tdown = downsample(t,n); 
    xdown = downsample(x_values,n)
    
    %All subplots, plots, titles and legend is stated for all plots in
    %part_b and part_c
    figure;
    subplot(2,1,1);
    plot(t, x_values, 'R'); %plot for part_b
    hold on;
    stem(tdown, xdown,'b', 'filled'); %plot for part_c
    xlabel("time(s)");
    ylabel("x(t)");
    title("Plot 1");
    grid on;
    ax = gca;
    ax.XMinorGrid = 'on';
    ax.YMinorGrid='on';
    legend("original plot", "sampled plot");
    hold off;

    %part_e
    recons_wave = zeros(size(t));% creates an array as of the same size of t with 0's
    for k = 1:length(tdown); %As the original formulae includes a summation with constant K this variables is used
    % sinc is used which replaces the pi and used for wave construction.    
    recons_wave = recons_wave + xdown(k) * sinc((t - tdown(k))/ T_s); 

    %All subplots, plots, titles and legend is stated for all plots in
    %part_e and part_f
    subplot(2,1,2);
    plot(t, x_values,'r');
    hold on;
    plot(t, recons_wave, 'g--', 'LineWidth',2);
    xlabel('time(s)');
    ylabel('x̃(t)');
    title("Recontructed wave");
    ylim([-5 5]);
    legend("Original signal", "Reconstructed signal");
    grid on;
    ax = gca;
    ax.XMinorGrid = 'on';
    ax.YMinorGrid = 'on';
    hold off;

end




 


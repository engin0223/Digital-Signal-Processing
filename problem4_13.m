car_engine = audioread("dynamic_V8.mp3");
bird = audioread("bana2.wav");
fs = 22050;

bird_dft = fft(bird);
car_engine_dft = fft(car_engine);

figure(1)
subplot(2, 2, 1);
plot(car_engine, "r");
title("Car engine sound");
subplot(2, 2, 2);
plot(imag(car_engine_dft), "r");
title("DFT of car engine sound");
subplot(2, 2, 3);
plot(bird, "g");
title("Bird sound");
subplot(2, 2, 4);
plot(imag(bird_dft), "g");
title("DFT of bird sound");

bird = [bird; zeros(size(car_engine, 1)-size(bird, 1), 1)];
combined = bird + car_engine;
combined_dft = fft(combined);

figure(3)
subplot(2, 2, 1);
plot(combined);
title("Combined sounds");
subplot(2, 2, 2);
plot(imag(combined_dft));
title("DFT of combined sounds")

cutoffp = 5*10^4;

combined_dft(end-cutoffp:end, 1) = 0;
combined_dft(1:cutoffp, 1) = 0;
combined_new = ifft(combined_dft);

subplot(2, 2, 3);
plot(real(combined_new));
title("Combined sounds reconstructed");
subplot(2, 2, 4);
plot(imag(combined_dft));
title("DFT of combined sounds reconstructed");


pause;
sound(combined, fs);
pause;
sound(real(combined_new), fs);






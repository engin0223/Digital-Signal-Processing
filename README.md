# Dijital Sinyal İşleme (DSP) Projeleri

Bu depo, Dijital Sinyal İşleme alanındaki çeşitli projeler ve problemler için bir MATLAB betik koleksiyonu içerir. Bunlar, Polonya'da **Erasmus+ bursuyla** gittiğim **AGH Bilim ve Teknoloji Üniversitesi**'ndeki bir ders sırasında laboratuvar ödevi olarak tamamlanmıştır. Her betik, örnekleme, Fourier dönüşümleri, filtre tasarımı ve ses sinyali analizi gibi DSP'deki temel bir kavramı veya algoritmayı gösterir.

## Ön Koşullar

Bu betikleri çalıştırmak için çalışan bir **MATLAB** kurulumuna sahip olmanız gerekir.

## Proje Açıklamaları

Bu depoda bulunan her MATLAB betiğinin kısa bir özeti aşağıdadır.

### `problem1_2.m`
Bu betik, frekans alanında **aliasing** kavramını gösterir. Örneklemeden sonra nasıl aynı göründüklerini göstermek için, birbirinin takma adı olan frekanslar da dahil olmak üzere farklı frekanslara sahip birden fazla sinüs dalgasını çizer. Betik ayrıca, sinyalleri ses olarak çalmak için bir bölüm içerir.

### `problem2_3.m`
Bu betik, **frekans modülasyonu** ve **cıvıltı sinyali** üretimine odaklanır. Zamanla değişen frekanslı bir sinyal oluşturmak için üstel bir fonksiyon kullanır ve `pspectrum` kullanarak sinyalin güç spektrumunu görselleştirir.

### `problem3_4.m`
Bu dosya, dönüşümler bağlamında **ortogonal matrislerin** özelliklerini inceler. İki matris oluşturur ve sonucun bir birim matris olup olmadığını görmek için bunları transpozlarıyla çarparak ortogonal olup olmadıklarını kontrol eder.

### `problem4_13.m`
Bu betik, **ses sinyali işleme** örneğidir. İki ses dosyasını, bir araba motoru sesini ve bir kuş sesini okur, bunları birleştirir ve ardından sinyali yeniden oluşturmak için ters Hızlı Fourier Dönüşümü (IFFT) gerçekleştirmeden önce frekans alanındaki yüksek frekanslı bileşenleri sıfırlayarak ilkel bir düşük geçiş filtresi uygular. Betik ayrıca sinyalleri ve DFT'lerini de çizer.

### `problem5_14.m`
Bu dosya, **Bölünmüş Tabanlı Hızlı Fourier Dönüşümü (FFT)** algoritmasının özel bir uygulamasını içerir. Özel işlevin sonuçlarını, doğruluğunu doğrulamak için yerleşik MATLAB `fft` işleviyle karşılaştırır.

### `problem6_2.m`
Bu betik, **FFT enterpolasyonu ve pencereleme** kullanarak spektral analizi gösterir. `rectwin`, `chebwin` ve `gausswin` gibi farklı pencereleme işlevlerinin bir sinyalin frekans spektrumunu nasıl etkilediğini gösterir.

### `problem7_5.m`
Bu betik, **filtre tasarımı ve analizi** için kullanılır. Hem Chebyshev hem de Butterworth filtrelerini tasarlamak ve özelliklerini analiz etmek için frekans tepkilerini çizmek için kod içerir.

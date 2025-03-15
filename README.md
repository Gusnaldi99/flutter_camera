# 1. Penjelasan Proyek Camera and Filter Application

## Penjelasan
Proyek ini bertujuan untuk menggunakan sistem kamera kamera dengan efek filter.

## Dependencies Yang Dipakai:
- camera: ^0.11.1
- camera_web: ^0.3.5
- path_provider: ^2.1.5
- path: ^1.9.0

## Komponen Utama:
1. **Camera Screen** = Menyediakan tampilan utama untuk menangkap gambar secara real-time menggunakan camera package.
2. **Image Filters** = Menerapkan berbagai filter pada gambar yang telah diambil.
3. **Real Time Preview Filter** = memungkinkan pengguna melihat efek filter secara langsung sebelum mengambil gambar.

## Dokumentasi
<!-- ![Nofilter](assets/images/NoFilter.jpg)
![Filter](assets/images/Filter.jpg) -->

<img src="assets/images/camera.jpg" alt="Camera" width="300px">
<img src="assets/images/hasilfoto.jpg" alt="Hasil dengan filter" width="300px">

# 2. Gabungkan hasil praktikum 1 dengan hasil praktikum 2 sehingga setelah melakukan pengambilan foto, dapat dibuat filter carouselnya!
## Done...

# 3. Jelaskan maksud void async pada praktikum 1?
## Maksud void async pada praktikum 1 adalah untuk digunakan agar kita bisa menangani operasi kamera secara asinkron tanpa mengganggu alur program utama.

# 4. Jelaskan fungsi dari anotasi @immutable dan @override ?

#### @immutable
@immutable adalah anotasi yang menandakan bahwa sebuah class tidak dapat diubah (immutable) setelah dibuat. contohnya  imutable yaitu untuk widget, Ini bantuin performance dan bikin pengelolahan mudah diprediksi.

#### @override
@override menandakan bahwa method tersebut menimpa (override) method dari class parent/superclass.

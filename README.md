# Find Kajian

**Find Kajian** adalah aplikasi Flutter yang dirancang untuk memudahkan pengguna menemukan kajian di berbagai tempat. Aplikasi ini berfokus pada kenyamanan pengguna dengan menyediakan fitur pencarian dan informasi detail terkait kajian yang diinginkan.

## Architecture

Architecture yang digunakan dalam **Find Kajian** adalah MVC dengan state management berbasis `ValueNotifier` dan `freezed`. Kami mengintegrasikan berbagai fitur seperti navigasi dengan `GetX`, caching gambar dengan `CachedNetworkImage`, dan pengelolaan tema dinamis (light dan dark mode).

## Fitur Utama

1. **Pencarian Ustadz dan Kajian**:
   - Memungkinkan pengguna untuk mencari ustadz berdasarkan nama dan kajian berdasarkan lokasi atau judul.
2. **Pencarian Tempat Kajian**:

   - Pengguna dapat mencari tempat tertentu untuk melihat kajian yang diadakan di sana, serta melihat informasi lengkap terkait tempat tersebut.

3. **Integrasi Lokasi**:

   - Dengan menggunakan `geolocator` dan `geocoding`, aplikasi ini mampu mendeteksi lokasi pengguna dan memberikan rekomendasi kajian terdekat.

4. **Form Profil Pengguna**:
   - Kami telah mempermudah proses pengelolaan profil pengguna dengan form yang dilengkapi dengan pilihan seperti jenis kelamin, pekerjaan, dan lokasi.

## Widget Reusable

Kami juga menyediakan beberapa widget custom untuk memudahkan pengembangan aplikasi, di antaranya:

```dart
QTextField
QNumberField
QMemoField
QDatePicker
QDropdownField
QImagePicker
QAutoComplete
```

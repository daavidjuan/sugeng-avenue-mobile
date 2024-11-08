David Juan Ananda
2306221913
PBP B

<details>
<summary>
  <span style="font-size:16px;"><b>Tugas 7 PBP</b></span>
</summary>

## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
Stateless widget adalah sebuah widget yang tidak memiliki state atau keadaan nya bisa berubah-ubah (dinamis). Widget ini digunakan
untuk tampilan yang statis dan tidak memerlukan perubahan data atau interaksi pengguna yang dinamis. Contohnya adalah `Text`, `Icon`, dan
`Container`.

Stateful widget adalah widget yang memiliki state yang dapat berubah selama aplikasi berjalan. Widget ini dapat merespons interaksi dari
pengguna atau perubahan data dengan memperbarui tampilannya. Stateful widget berguna untuk tampilan yang dinamis dan interaktif, seperti
`Checkbox`, `Slider`, dan `TextField`.

Perbedaan dari kedua widget tersebut adalah stateless widget tidak dapat berubah setelah dibuat, stateful widget dapat berubah selama siklus
hidupnya atau selama aplikasi berjalan.

## Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
- `MaterialApp`, root dari aplikasi Flutter untuk mengatur tema aplikasi serta konfigurasi awal. Widget ini adalah widget utama dan mengatur navigasi
serta tampilan keseluruhan aplikasi.
- `Scaffold`, menyediakan struktur dasar halaman seperti AppBar dan body. Scaffold digunakan untuk kerangka dasar untuk halaman aplikasi.
- `AppBar`, menampilkan bagian atas halaman yang berisi judul dari aplikasi.
- `Padding`, memberikan jarak/ruang di sekeliling widget lain agar lebih rapi.
- `Column`, menyusun tata letak widget secara vertikal.
- `Row`, menyusun tata letak widget secara horizontal.
- `InfoCard`, menampilkan kartu informasi dengan judul dan isi.
- `ItemCard`, menampilkan kartu dengan ikon dan nama.
- `GridView`, menampilkan item dalam bentuk grid.
- `InkWell`, memberikan efek ripple saat widget diclick dan menangani action saat diclick.
- `SnackBar`, menampilkan pesan sementara di bagian bawah tampilan layar saat kartu diclick.
- `Icon`, menampilkan ikon.
- `Text`, menampilkan text.

## Apa fungsi dari `setState()`? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
Fungsi `setState()` digunakan dalam widget stateful untuk memberitahu Flutter bahwa ada perubahan pada state yang memerlukan pembaruan tampilan. 
Ketika `setState()` dipanggil, Flutter akan menjalankan ulang metode `build()` dari widget tersebut, sehingga tampilan dapat diperbarui sesuai dengan perubahan state.
Variabel yang dapat terdampak oleh `setState()` adalah semua variabel yang berada dalam kelas state dari widget stateful dan digunakan dalam metode `build()`. 
Perubahan pada variabel-variabel ini akan menyebabkan tampilan widget diperbarui. Contoh variabel yang dapat terdampak adalah variabel yang menyimpan data dinamis seperti teks, angka, atau status boolean yang digunakan untuk mengontrol tampilan widget.

## Jelaskan perbedaan antara `const` dengan `final`.
Final digunakan untuk mendeklarasikan variabel yang hanya dapat diinisialisasi sekali dan tidak dapat diubah setelah itu. Final dapat digunakan untuk
variabel yang nilainya diketahui saat runtime. Sedangkan Const digunakan untuk mendeklarasikan variabel yang harus diketahui saat compile dan bersifat kosntan serta tidak akan
pernah berubah (immutable).

## Pengimplementasian Checklist
- Pertama, saya membuat sebuah program flutter baru dengan judul sugeng_avenue.
- Kemudian, saya memodifikasi file `main.dart` pada directory lib untuk menjalankan widget yang sudah dibuat dan menentukan `colorScheme`.
```
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sugeng Avenue',
      theme: ThemeData(
      colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
      ).copyWith(secondary: Colors.blue[800]),
      useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
```
- Kemudian, saya membuat suatu file bernama `menu.dart` dan membuat constructor, beberapa variabel final, dan list item yang akan ditampilkan serta memberikan warna yang berbeda untuk setiap button item tersebut.
```
final String npm = '2306221913'; // NPM
final String name = 'David Juan Ananda'; // Nama
final String className = 'PBP B'; // Kelas
MyHomePage({super.key});

final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.list, const Color.fromARGB(230, 19, 125, 187)),
    ItemHomepage("Tambah Produk", Icons.add, const Color.fromARGB(255, 221, 190, 50)),
    ItemHomepage("Logout", Icons.logout, const Color.fromARGB(255, 221, 71, 71)),
];
```
- Membuat class `ItemHomepage` yang memiliki atribut nama, icon, dan color.
```
class ItemHomepage {
    final String name;
    final IconData icon;
    final Color color;

    ItemHomepage(this.name, this.icon, this.color);
}
```
- Kemudian, saya membuat sebuah class bernama `ItemCard` yang menampung class yang ada di `ItemHomepage` dan styling untuk menampilkannya sebagai sebuah tombol. Pada class ini juga dapat menampilkan SnackBar dengan fungsi built-in.
```
class ItemCard extends StatelessWidget {
  // Menampilkan kartu dengan ikon dan nama.

  final ItemHomepage item; 
  
  const ItemCard(this.item, {super.key}); 

  @override
  Widget build(BuildContext context) {
    return Material(
      // Menentukan warna latar belakang dari tema aplikasi.
      color: item.color,
      // Membuat sudut kartu melengkung.
      borderRadius: BorderRadius.circular(12),
      
      child: InkWell(
        // Aksi ketika kartu ditekan.
        onTap: () {
          // Menampilkan pesan SnackBar saat kartu ditekan.
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
            );
        },
        // Container untuk menyimpan Icon dan Text
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              // Menyusun ikon dan teks di tengah kartu.
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```
- Terakhir, saya mengintegrasikan `InfoCard` dan `ItemCard` untuk ditampilkan di `MyHomePage`.
```
Widget build(BuildContext context) {
  // Scaffold menyediakan struktur dasar halaman dengan AppBar dan body.
  return Scaffold(
    // AppBar adalah bagian atas halaman yang menampilkan judul.
    appBar: AppBar(
      // Judul aplikasi "Mental Health Tracker" dengan teks putih dan tebal.
      title: const Text(
        'Sugeng Avenue',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      // Warna latar belakang AppBar diambil dari skema warna tema aplikasi.
      backgroundColor: Theme.of(context).colorScheme.primary,
    ),
    // Body halaman dengan padding di sekelilingnya.
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      // Menyusun widget secara vertikal dalam sebuah kolom.
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Row untuk menampilkan 3 InfoCard secara horizontal.
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InfoCard(title: 'NPM', content: npm),
              InfoCard(title: 'Name', content: name),
              InfoCard(title: 'Class', content: className),
            ],
          ),

          // Memberikan jarak vertikal 16 unit.
          const SizedBox(height: 16.0),

          // Menempatkan widget berikutnya di tengah halaman.
          Center(
            child: Column(
              // Menyusun teks dan grid item secara vertikal.

              children: [
                // Menampilkan teks sambutan dengan gaya tebal dan ukuran 18.
                const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Text(
                    'Welcome to Sugeng Avenue!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),

                // Grid untuk menampilkan ItemCard dalam bentuk grid 3 kolom.
                GridView.count(
                  primary: true,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 3,
                  // Agar grid menyesuaikan tinggi kontennya.
                  shrinkWrap: true,

                  // Menampilkan ItemCard untuk setiap item dalam list items.
                  children: items.map((ItemHomepage item) {
                    return ItemCard(item);
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
```
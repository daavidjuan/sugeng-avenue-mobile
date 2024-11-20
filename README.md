David Juan Ananda
2306221913
PBP B

<details>
<summary>
  <span style="font-size:18px;"><b>Tugas 7 PBP</b></span>
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
</details>

<details>
<summary>
  <span style="font-size:18px;"><b>Tugas 8 PBP</b></span>
</summary>

## Apa kegunaan `const` di Flutter? Jelaskan apa keuntungan ketika menggunakan `const` pada kode Flutter. Kapan sebaiknya kita menggunakan `const`, dan kapan sebaiknya tidak digunakan?
`const` digunakan untuk mengoptimalkan memori dan meningkatkan performa. `const` dapat membuat objek yang immutable, atau tidak bisa diubah setelah diinisialisasi, yang biasa digunakan untuk widget atau elemen UI yang statis. Flutter memiliki keuntungan, seperti efisiensi memori. Objek yang dideklarasikan dengan `const` hanya dibuat sekali dan digunakan kembali sehingga menghemat penggunaan memori dan mempercepat rendering UI, karena widget yang ditandai dengan const tidak perlu di-rebuild setiap kali tampilan di-refresh. Karena objek dihitung saat waktu kompilasi, aplikasi berjalan lebih cepat karena tidak perlu membuat ulang objek tersebut setiap kali widget di-render.

Kita sebaiknya menggunakan const untuk widget atau objek yang tidak berubah selama runtime aplikasi. Misalnya, ketika mendefinisikan teks, padding, atau ikon yang bersifat tetap. Contoh penggunaan const yang tepat berdasarkan proyek ini adalah:
```
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
```
Pada kode di atas, `const` digunakan untuk `Padding` karena isi pada `Padding`, terdapat `Text` dan `TextStyle` yang tidak akan berubah selama aplikasi berjalan. `const` sebaiknya tidak digunakan jika widget atau objek memerlukan data yang dapat berubah selama runtime.

## Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
Column adalah widget layout yang menyusun children-nya secara vertikal dari atas ke bawah. Sedangkan, Row adalah widget layout yang menyusun children-nya secara horizontal dari kiri ke kanan. Perbedaan dari keduanya hanya terdapat pada cara masing-masing widget ini menyusun children-nya.

Contoh implementasi Column :
```
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
    Text('Item 1'),
    Text('Item 2'),
    Text('Item 3'),
  ],
)
```

Contoh implementasi Row : 
```
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: <Widget>[
    Text('Item A'),
    Text('Item B'),
    Text('Item C'),
  ],
)
```

## Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
Elemen input yang saya gunakan pada halaman form adalah `TextFormField` yang berguna untuk input text seperti nama product, deskripsi, dan amount. Setelah itu, saya menggunakan `ElevatedButton` yang berguna untuk tombol aksi seperti menyimpan data.

Elemen input yang tidak saya gunakan pada tugas ini adalah :
- Radio : untuk memilih satu opsi dari beberapa pilihan
- Switch : untuk input boolean yang dapat diaktifkan atau dinonaktifkan
- Dropdown Button : untuk memilih satu opsi dari daftar dropdown

## Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
Untuk mengatur tema dalam aplikasi yang saya buat, saya menggunakan `ThemeData` dan `ColorScheme` di dalam widget `MaterialApp` dan di dalam file `main.dart`. Warna yang digunakan dalam aplikasi ini terdapat pada `main.dart`:
```
...
colorScheme: ColorScheme.fromSwatch(
  primarySwatch: Colors.blue,
  ).copyWith(secondary: Colors.blue[800]),
  useMaterial3: true,
...

``` 

## Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
Menangani navigasi dalam aplikasi dengan banyak halaman dapat dilakukan dengan menggunakan `Navigator` dan `MaterialPageRoute`. Dalam aplikasi ini, saya menggunakan `Navigator.push()` dan `Navigator.pop()`. `Navigator.push()` dapat menambahkan halaman baru ke stack navigasi, kemudian halaman baru tersebut berada di atas halaman sebelumnya, sehingga user dapat menggunakan button 'back' untuk kembali ke halaman sebelumnya. Selain itu, `Navigator.pop()` dapat menghapus halaman yang berada di paling atas stack dan kembali ke halaman selanjutnya.

</details>

<details>
<summary>
  <span style="font-size:18px;"><b>Tugas 9 PBP</b></span>
</summary>

## Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?
Kita perlu untuk membuat model terlebih dahulu untuk mempermudah proses untuk serialize dan deserialize data pada JSON ke dalam objek. Dengan model, struktur data menjadi lebih jelas dan tipe data dapat divalidasi atau diverifikasi oleh compiler lebih mudah.

Jika tidak membuat model terlebih dahulu, kita masih bisa untuk mengolah data JSON  tetapi secara manual. Hal ini dapat menyebabkan kode lebih rentan terhadap kesalahan tipe data dan meningkatkan risiko terjadinya error.

## Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini
Library `http` berfungsi untuk melakukan pengiriman permintaan HTTP. Dengan menggunakan library `http`, kita dapat mengirimkan permintaan HTTP seperti GET, POST, PUT, dan DELETE ke server, serta menerima respons yang dikirimkan oleh server. Pada tugas ini berfungsi sebagai alat untuk melakukan komunikasi antara aplikasi Flutter dengan server backend melalui protokol HTTP.

Dalam pengimplementasian library `http` di tugas ini, library tersebut digunakan untuk mengirim data login dan registrasi ke server untuk proses autentikasi dan melakukan request ke API server untuk mengambil data JSON yang kemudian diolah atau ditampilkan dalam aplikasi. Contohnya adalah untuk mengambil data nama product, harga product, deskripsi product, dan rating product.

## Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
`CookieRequest` adalah kelas yang digunakan untuk melakukan permintaan HTTP dengan dukungan penanganan cookie dalam aplikasi Flutter. Fungsi utamanya adalah untuk menjaga sesi autentikasi pengguna saat berkomunikasi dengan server backend, seperti Django, yang mengandalkan cookie untuk manajemen sesi.

Instance `CookieRequest` perlu dibagikan ke semua komponen dalam aplikasi Flutter agar status autentikasi dan sesi pengguna tetap konsisten di seluruh aplikasi. Dengan menggunakan instance yang sama, setiap permintaan HTTP yang dilakukan dari berbagai bagian aplikasi akan menyertakan cookie sesi yang sama. Hal ini memastikan bahwa server backend dapat mengenali dan mempertahankan status login pengguna, sehingga pengguna tidak perlu melakukan autentikasi ulang setiap kali berpindah antar halaman atau fitur dalam aplikasi.

## Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

- Pengambilan Input dari Pengguna :
Pengguna mengisi data melalui form yang tersedia di aplikasi Flutter. Data yang dimasukkan, seperti nama product, deskripsi product, harga product, dan rating product (contoh pada form penambahan product), akan dikumpulkan dan divalidasi sebelum dikirim ke server.

- Pengiriman Data ke Server :
Setelah data berhasil divalidasi, aplikasi Flutter mengirimkannya ke server menggunakan permintaan HTTP POST, dengan bantuan library seperti `http` atau `pbp_django_auth`. Data tersebut dikirim dalam format JSON. Contohnya, pengiriman data dapat dilakukan menggunakan objek CookieRequest.

- Pemrosesan Data di Server : 
Server menerima data dari aplikasi Flutter dan memprosesnya sesuai logika bisnis yang berlaku. Data tersebut kemudian disimpan ke dalam database. Setelahnya, server mengirimkan respons dalam format JSON yang mencakup status operasi dan data terkait ke aplikasi Flutter.

- Menampilkan Data di Aplikasi Flutter : 
Aplikasi Flutter memproses respons yang diterima dari server dan menampilkan hasilnya kepada pengguna. Misalnya, setelah menambahkan product baru, aplikasi dapat memperbarui product list dengan melakukan permintaan HTTP GET untuk mendapatkan data terbaru dari server dan menampilkannya dalam bentuk daftar atau grid.

## Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

### Register
- Input data akun : user akan memasukkan data akun seperti username dan password melalui form register yang tersedia di aplikasi flutter.
- Proses data ke server : data yang dimasukkan dikirim ke server Django menggunakan permintaan HTTP POST
- Proses di Server: server Django memproses data yang diterima, memvalidasi, dan menyimpan data akun yang baru dibuat ke database. Jika berhasil, server mengirimkan respons sukses.
- Tampilan di Flutter : aplikasi Flutter menerima respons dari server dan menampilkan pesan sukses atau gagal. Jika sukses, pengguna diarahkan ke halaman login.

### Login
- Input data akun : user memasukkan username dan password melalui form login yang tersedia di aplikasi Flutter.
- Proses data ke server : data login dikirim ke server Django menggunakan permintaan HTTP POST.
- Proses di server : server Django akan memverifikasi kredensial yang diterima. Jika valid, server mengirimkan cookie session yang menandakan bahwa pengguna telah berhasil login.
- Tampilan di Flutter : aplikasi Flutter menerima cookie session dan menyimpannya. User diarahkan ke page menu dan user dapat menggunakan fitur yang ada.

### Logout
- Request : user menekan button logout yang tersedia di aplikasi Flutter.
- Proses data ke server : aplikasi Flutter mengirim permintaan logout ke server Django menggunakan permintaan HTTP POST.
- Tampilan di Flutter : jika berhasil untuk logout, user akan diarahkan kembali ke login page.

## Implementasi Checklist
- Pertama, saya membuat file `register.dart` di directory `sugeng_avenue/screens/register.dart`.
- Pada `register.dart` saya membuat untuk registrasi username, password, dan password confirmation. 
```
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sugeng_avenue/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      hintText: 'Enter your username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      hintText: 'Confirm your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () async {
                      String username = _usernameController.text;
                      String password1 = _passwordController.text;
                      String password2 = _confirmPasswordController.text;

                      // Cek kredensial
                      // Untuk menyambungkan Android emulator dengan Django pada localhost,
                      // gunakan URL http://10.0.2.2/
                      final response = await request.postJson(
                          "http://127.0.0.1:8000//auth/register/",
                          jsonEncode({
                            "username": username,
                            "password1": password1,
                            "password2": password2,
                          }));
                      if (context.mounted) {
                        if (response['status'] == 'success') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Successfully registered!'),
                            ),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Failed to register!'),
                            ),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: const Text('Register'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
``` 
- Saya mengintegrasikan sistem autentikasi Django dengan proyek Flutter menggunakan package `pbp_django_auth` dan `provider`.
- Saya membuat halaman login pada proyek tugas Flutter di file `login.dart` di directory sugeng_avenue/lib/screens.
- Saya membuat model custom sesuai dengan proyek aplikasi Django di file `product_entry.dart` di directory sugeng_avenue/lib/models.
- Kemudian, saya membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah saya deploy di file `list_productentry.dart` di directory sugeng_avenue/lib/screens.
- Saya membuat halaman detail untuk setiap item yang terdapat pada halaman daftar item di file `product_detail.dart` di directory sugeng_avenue/lib/screens.
```
import 'package:flutter/material.dart';
import 'package:sugeng_avenue/models/product_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntry product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.fields.name),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Gambar produk
            const SizedBox(
              height: 250,
              width: double.infinity,
            ),
            // Detail produk
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Nama produk
                      Text(
                        product.fields.name,
                        style: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Harga dan Rating
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Rp${product.fields.price}",
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.green,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Text(
                                "${product.fields.rating}/10",
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(height: 30.0),
                      // Deskripsi
                      const Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        product.fields.description,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```
- Saya melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login di file `list_productentry.dart.`
- Saya juga membuat fitur logout dengan proses yang hampir sama dengan login.

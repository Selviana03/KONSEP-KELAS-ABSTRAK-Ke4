import 'dart:math';

// --- BAGIAN 1, 2, 3: Polimorfisme & Abstract Class ---

abstract class Pekerja {
  String nama;
  Pekerja(this.nama);

  // Method abstract
  void bekerja();

  // Method non-abstract
  void info() => print("Nama pekerja: $nama");
}

class Programmer extends Pekerja {
  Programmer(String nama) : super(nama);
  @override
  void bekerja() => print("$nama sedang menulis kode.");
}

class Dokter extends Pekerja {
  Dokter(String nama) : super(nama);
  @override
  void bekerja() => print("$nama sedang memeriksa pasien.");
}

class Guru extends Pekerja {
  Guru(String nama) : super(nama);
  @override
  void bekerja() => print("$nama sedang mengajar di kelas.");
}

// --- BAGIAN 4: Pewarisan/Mixins (Interface) ---
// Dart menggunakan 'implements' untuk simulasi multiple inheritance
class Komputer { void boot() => print("Komputer menyala"); }
class Kamera { void ambilFoto() => print("Kamera mengambil foto"); }
class Telepon { void panggil() => print("Telepon berdering"); }

class Tablet implements Komputer, Kamera, Telepon {
  @override void boot() => print("Tablet booting...");
  @override void ambilFoto() => print("Tablet mengambil foto...");
  @override void panggil() => print("Tablet melakukan panggilan...");
}

// --- BAGIAN 5: MathUtils (Static Methods) ---
class MathUtils {
  static int factorial(int n) => n <= 1 ? 1 : n * factorial(n - 1);
  
  static bool isPrime(int n) {
    if (n < 2) return false;
    for (int i = 2; i <= sqrt(n); i++) if (n % i == 0) return false;
    return true;
  }

  static double roundDouble(double val, int places) => 
      double.parse(val.toStringAsFixed(places));

  static int randomInt(int min, int max) => Random().nextInt(max - min + 1) + min;

  static double rataRata(List<num> angka) => 
      angka.reduce((a, b) => a + b) / angka.length;

  static double median(List<num> angka) {
    angka.sort();
    int mid = angka.length ~/ 2;
    return angka.length.isOdd ? angka[mid].toDouble() : (angka[mid - 1] + angka[mid]) / 2;
  }
}

void main() {
  // Demo Polimorfisme
  List<Pekerja> daftarPekerja = [Programmer("Budi"), Dokter("Siti"), Guru("Andi")];
  for (var p in daftarPekerja) {
    p.info();
    p.bekerja();
  }

  // Demo Tablet
  Tablet tablet = Tablet();
  tablet.boot();

  // Demo MathUtils
  print("Faktorial 5: ${MathUtils.factorial(5)}");
  print("Apakah 7 prima?: ${MathUtils.isPrime(7)}");
  print("Rata-rata [10, 20, 30]: ${MathUtils.rataRata([10, 20, 30])}");
}

String formatRupiah(int nominal) {
  final String angka = nominal.toString();
  final StringBuffer hasil = StringBuffer();
  int sisa = angka.length % 3;

  if (sisa == 0) {
    sisa = 3;
  }

  hasil.write(angka.substring(0, sisa));
  int index = sisa;

  while (index < angka.length) {
    hasil.write('.');
    hasil.write(angka.substring(index, index + 3));
    index += 3;
  }

  return 'Rp${hasil.toString()}';
}

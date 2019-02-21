# Soal Shift Modul 1

## No 1
##### Soal
Anda diminta tolong oleh teman anda untuk mengembalikan filenya yang telah dienkripsi oleh seseorang menggunakan bash script, file yang dimaksud adalah nature.zip. Karena terlalu mudah kalian memberikan syarat akan membuka seluruh file tersebut jika pukul 14:14 pada tanggal 14 Februari atau hari tersebut adalah hari jumat pada bulan Februari.
##### Jawab
Pertama mengekstrak file zip dengan cara unzip file 
```bash
base64 -d /home/arisatox/Downloads/nature/$x | xxd -r > /home/arisatox/Downloads/tes/$x
```
Setelah itu mendecode setiap file. Hasil dari decode tersebut di kembalikan/reverse menjadi file dengan perintah `xxd -r`
```bash
14 14 14 2 5 /bin/bash /path/to/script.sh
```
Untuk crontab menggunakan konfigurasi seperti di atas.
## No 2
##### Soal
Anda merupakan pegawai magang pada sebuah perusahaan retail, dan anda diminta untuk memberikan laporan berdasarkan file WA_Sales_Products_2012-14.csv. Laporan yang diminta berupa:
##### Jawab
1. Tentukan negara dengan penjualan(quantity) terbanyak pada tahun 2012.

    `cat /home/arisatox/Downloads/WA_Sales_Products_2012-14.csv| awk 'BEGIN {FS=","} {if($7==2012)arr[$1]+=$10}END{for(a in arr)print arr[a]","a}'| sort -rg | awk 'NR==1'|awk 'BEGIN {FS=","}{print $2}' > soal2a.txt`
    
    Pertama membaca file csv dengan cat. `FS=","`menjadikan field separator dengan koma. Setelah itu mengisi array of Country dengan isi Quantity product (dengan syarat Year==2012) disetiap barisnya. Hasil dari array tersebut disort dan diambil Country dengan Quantity yang tertinggi dan hasil disimpan ke file `soal2a.txt`
2. Tentukan tiga product line yang memberikan penjualan(quantity) terbanyak pada soal poin a.
3. Tentukan tiga product yang memberikan penjualan(quantity) terbanyak berdasarkan tiga product line yang didapatkan pada soal poin b.
### 3. No 3
##### Soal
Buatlah sebuah script bash yang dapat menghasilkan password secara acak
sebanyak 12 karakter yang terdapat huruf besar, huruf kecil, dan angka. Password
acak tersebut disimpan pada file berekstensi .txt dengan ketentuan pemberian nama
sebagai berikut:
1. Jika tidak ditemukan file password1.txt maka password acak tersebut disimpan pada file bernama password1.txt
2. Jika file password1.txt sudah ada maka password acak baru akan disimpan pada file bernama password2.txt dan begitu seterusnya.
3. Urutan nama file tidak boleh ada yang terlewatkan meski filenya dihapus.
4. Password yang dihasilkan tidak boleh sama.
##### Jawab
### 4. No 4
##### Soal
Lakukan backup file syslog setiap jam dengan format nama file “jam:menit tanggal-bulan-tahun”. Isi dari file backup terenkripsi dengan konversi huruf (string manipulation) yang disesuaikan dengan jam dilakukannya backup misalkan sebagai berikut:
1. Huruf b adalah alfabet kedua, sedangkan saat ini waktu menunjukkan pukul 12, sehingga huruf b diganti dengan huruf alfabet yang memiliki urutan ke 12+2 = 14.
2. Hasilnya huruf b menjadi huruf n karena huruf n adalah huruf ke empat belas, dan seterusnya.
3. setelah huruf z akan kembali ke huruf a
4. Backup file syslog setiap jam.
5. dan buatkan juga bash script untuk dekripsinya.
##### Jawab
```bash
#!/bin/bash

lowerCase=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
upperCase=(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)

tgl=`date +"%d"`
bln=`date +"%m"`
thn=`date +"%Y"`
jam=`date +"%H"`
menit=`date +"%M"`

home="/home/anantadwi13/SISOP/modul1"
namafile="$home/$jam:$menit $tgl-$bln-$thn.txt"

bawah=${lowerCase[$jam]}
atas=${upperCase[$jam]}

cat "/var/log/syslog" | tr '[a-z]' "[$bawah-za-$bawah]" | tr '[A-Z]' "[$atas-ZA-$atas]" > "$namafile"
```
Menggunakan command `tr`. File syslog diambil dengan command `cat` setelah itu char yang berada pada range [a-z] akan diubah menjadi [c-za-c] satu persatu apabila $jam menunjukkan 2 (maksudnya a menjadi c, b menjadi d, c menjadi e, dst). Range [b-za-b] maksudnya adalah dari char b s/d z dilanjut a s/d b. Selanjutnya untuk huruf besar dilakukan cara yang sama seperti sebelumnya.
```bash
0 * * * * /bin/bash /path/to/script
#atau
@hourly /bin/bash /path/to/script    
```
Untuk crontab menggunakan konfigurasi seperti di atas.
### 5. No 5
##### Soal
Buatlah sebuah script bash untuk menyimpan record dalam syslog yang memenuhi
kriteria berikut:
1. Tidak mengandung string “sudo”, tetapi mengandung string “cron”, serta buatlah pencarian stringnya tidak bersifat case sensitive, sehingga huruf kapital atau tidak, tidak menjadi masalah.
2. Jumlah field (number of field) pada baris tersebut berjumlah kurang dari 13.
3. Masukkan record tadi ke dalam file logs yang berada pada direktori /home/[user]/modul1.
4. Jalankan script tadi setiap 6 menit dari menit ke 2 hingga 30, contoh 13:02, 13:08, 13:14, dst.
##### Jawab

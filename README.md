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
##### Jawab
### 4. No 4
##### Soal
##### Jawab
### 5. No 5
##### Soal
##### Jawab

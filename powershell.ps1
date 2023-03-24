# Wygeneruj przyk�adowe dane i zapisz je do pliku dane.txt
Set-Content -Path dane.txt -Value "Nazwa Wartosc1 Wartosc2 Wartosc3" 
Add-Content -Path dane.txt -Value "A 10 20 30" 
Add-Content -Path dane.txt -Value "B 5 15 25" 
Add-Content -Path dane.txt -Value "C 7 30 35" 
Add-Content -Path dane.txt -Value "D 15 5 10"

# Wczytaj plik z danymi
$data_file = "dane.txt"

# Zdefiniuj nazwy kolumn
$column1 = "Nazwa"
$column2 = "Wartosc1"
$column3 = "Wartosc2"
$column4 = "Wartosc3"

# Oblicz warto�ci dla ka�dej kolumny
$max2 = 0
$sum2 = 0
$sum3 = 0
$sum4 = 0
$count = 0

foreach ($line in Get-Content $data_file) {
  $name = ($line -split ' ')[0]
  $value2 = ($line -split ' ')[1]
  $value3 = ($line -split ' ')[2]
  $value4 = ($line -split ' ')[3]

  # Oblicz najwi�ksz� warto�� w kolumnie drugiej
  if ($value2 -gt $max2) {
    $max2 = $value2
    $max2_name = $name
  }

  # Oblicz sumy dla kolumn trzeciej i czwartej
  $sum2 += $value2
  $sum3 += $value3
  $sum4 += $value4

  # Zwi�ksz licznik element�w
  $count++
}

# Oblicz �rednie warto�ci dla ka�dej kolumny
$avg2 = $sum2/$count
$avg3 = $sum3/$count
$avg4 = $sum4/$count

# Wy�wietl wyniki
Write-Host "$column2: Najwi�ksza warto�� to $max2 dla elementu $max2_name"
Write-Host "$column2: �rednia warto�� to $avg2"
Write-Host "$column3: �rednia warto�� to $avg3"
Write-Host "$column4: �rednia warto�� to $avg4"
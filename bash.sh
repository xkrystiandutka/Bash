#!/bin/bash

# Wygeneruj przykładowe dane i zapisz je do pliku dane.txt
echo "Nazwa Wartosc1 Wartosc2 Wartosc3" > dane.txt
echo "A 10 20 30" >> dane.txt
echo "B 5 15 25" >> dane.txt
echo "C 7 30 35" >> dane.txt
echo "D 15 5 10" >> dane.txt

# Wczytaj plik z danymi
data_file="dane.txt"

# Zdefiniuj nazwy kolumn
column1="Nazwa"
column2="Wartosc1"
column3="Wartosc2"
column4="Wartosc3"

# Oblicz wartości dla każdej kolumny
max2=0
sum2=0
sum3=0
sum4=0
count=0

while read -r line
do
  name=$(echo "$line" | awk '{print $1}')
  value2=$(echo "$line" | awk '{print $2}')
  value3=$(echo "$line" | awk '{print $3}')
  value4=$(echo "$line" | awk '{print $4}')

  # Oblicz największą wartość w kolumnie drugiej
  if (( $value2 > $max2 )); then
    max2=$value2
    max2_name=$name
  fi

  # Oblicz sumy dla kolumn trzeciej i czwartej
  sum2=$(( $sum2 + $value2 ))
  sum3=$(( $sum3 + $value3 ))
  sum4=$(( $sum4 + $value4 ))

  # Zwiększ licznik elementów
  ((count++))

done < "$data_file"

# Oblicz średnie wartości dla każdej kolumny
avg2=$(awk "BEGIN {print $sum2/$count}")
avg3=$(awk "BEGIN {print $sum3/$count}")
avg4=$(awk "BEGIN {print $sum4/$count}")

# Wyświetl wyniki
echo "$column2: Największa wartość to $max2 dla elementu $max2_name"
echo "$column2: Średnia wartość to $avg2"
echo "$column3: Średnia wartość to $avg3"
echo "$column4: Średnia wartość to $avg4"
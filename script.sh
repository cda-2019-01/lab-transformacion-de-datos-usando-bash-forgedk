# Escriba su código aquí
#! /usr/bin/env bash
#!/bin/bash
# Arreglo de CSV para QUERY SQL

ImprimirArchivo(){
    mkdir temporal
  sed 's#\t#_#g' $1 > temporal.txt
  sed -i 's#   #_#g'  temporal.txt
  sed -i 's#   #_#g'  temporal.txt
  sed -i 's#^\n##g'  temporal.txt
readarray ArregloDeLineas < temporal.txt
LineaProcesada=1
for Registro in ${ArregloDeLineas[@]}
do
RemplazoPorEspacio=$(echo "$Registro" | sed 's/_/ /g')
RemplazoPorComas=$(echo "$RemplazoPorEspacio" | sed 's/,/ /g')
LineaSeparada=(${RemplazoPorComas})
LogintudArregloEnLinea=${#LineaSeparada[@]}
  for (( i=1; i<$LogintudArregloEnLinea; i++ ))
  do
    echo $1,$LineaProcesada,${LineaSeparada[0]},${LineaSeparada[i]}
  done
  LineaProcesada=$((1 + LineaProcesada))
done
   rm -r temporal
}





ImprimirArchivo data1.csv
ImprimirArchivo data2.csv
ImprimirArchivo data3.csv


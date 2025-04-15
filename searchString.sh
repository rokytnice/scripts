#!/bin/bash

# Variablen definieren

ordner=$1
string=$2

# Alle Dateien im Ordner durchlaufen

for datei in $(find $ordner -name "*.gz"); do

  # Datei auspacken

  gunzip -c $datei > $(basename $datei .gz)

  # Datei nach String durchsuchen

  if grep -q "$string" $(basename $datei .gz); then
    echo "$datei enthält den String '$string'"
  fi

done

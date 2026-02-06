#!/bin/bash

# Script per compilare e lanciare il visualizer

set -e

echo "🔨 Compilazione in corso..."
make

if [ ! -f push_swap ]; then
    echo "❌ Errore: push_swap non compilato correttamente"
    exit 1
fi

# Assicuriamoci che push_swap sia eseguibile
chmod +x push_swap

if [ ! -f visualizer/build/bin/visualizer ]; then
    echo "❌ Errore: visualizer non trovato"
    exit 1
fi

echo "🚀 Avvio visualizer..."
# Crea un symlink a push_swap nella directory visualizer per il path relativo
cd visualizer
ln -sf ../push_swap push_swap 2>/dev/null || true
cd build/bin && LD_LIBRARY_PATH=../../../visualizer/build/_deps/sfml-build/lib:$LD_LIBRARY_PATH ./visualizer

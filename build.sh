#!/bin/sh -e

if command -v gpio &> /dev/null
then
    echo "WiringPi está instalado. (Omitiendo su instalacion)"
else
    echo "WiringPi no está instalado. Instalando ahora...."
    sudo apt-get purge wiringpi
    hash -r
    git clone https://github.com/WiringPi/WiringPi.git
    cd WiringPi
    ./build.sh
fi

make

echo ""
echo "Asegurate de incluir las banderas -lcontrol y -lwiringPi al compilar tus proyectos"
echo "Puedes eliminar esta carpeta con seguridad."
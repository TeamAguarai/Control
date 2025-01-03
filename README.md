<div align="center">
<h1>Control</h1>

Controla un vehículo RC como el <a href="https://www.amazon.com/Hobao-HB-VS-C30BU-Hyper-Buggy-Engine/dp/B00MY3ROS2">HYPER VS 1/8 BUGGY NITRO</a> a través de un **Raspberry Pi 3** con *C++*
</div>

## ⚠️ Instalación
> El proyecto está diseñado únicamente para un vehículo con características idénticas al [HYPER VS 1/8 BUGGY NITRO](https://www.amazon.com/Hobao-HB-VS-C30BU-Hyper-Buggy-Engine/dp/B00MY3ROS2)

Antes de empezar a programar debes de instalar las librerias necesarias.

### ⚡Método rápido (recomendado)
En cualquier carpeta de tu sistema, clona este repositorio y ejecuta el archivo <a href="https://github.com/TeamAguarai/Control/blob/main/setup.sh">build.sh</a> (con permisos de administrador)
```bash
git clone https://github.com/TeamAguarai/Control
cd Control
chmod +x ./build.sh
sudo ./build.sh
```

### 🤓 Método Hazlo tu mismo
Primero, en caso de no tenerlo instalado, instala WiringPi
```bash
sudo apt-get purge wiringpi
hash -r
git clone https://github.com/WiringPi/WiringPi.git
cd WiringPi
./build
```

Por último, clona este repositorio e instala control.h ejecutando el makefile
```bash
git clone https://github.com/TeamAguarai/Control
cd Control
sudo make
```


## 🎮 Uso
Para poder poder compilar tus proyectos asegurate de incluir las banderas -lcontrol -lwiringPi
```bash
g++ main.cpp -o main -lcontrol -lwiringPi
```



## 🔎 Ejemplos rápidos

Utiliza un controlador PID para gestionar el movimiento del motor
```c
control::Drive drive;
drive.definePid(0.4369, 0.6735, 0, 0, 0, 7.4, -10, 10);
drive.defineTransferFunction(polinomialRegression);
drive.defineMotor(13, 1.57, 1.57, 2.0);
drive.defineVelocimeter(17, 0.105);
drive.run(2.5);
```

Realiza mediciones de velocidad a traves de sensores de pulso (Efecto Hall, Infrarojo, etc.)
```c
control::Velocimeter velocimeter;
velocimeter.definePin(17);
velocimeter.defineWheelDiameter(0.105);

while (running)
{
    velocimeter.start();
    velocimeter.waitForUpdate();

    std::cout << velocimeter.getSpeed() << std::endl;
}
```

## 👨‍🔬Funcionamiento
> ejemplos con imágenes y código de la estructura y funcionamiento del proyecto ...
## ⭐ API
> descripción detallada de las clases y métodos 

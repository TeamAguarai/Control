SRC = $(wildcard src/*.cpp)
HDR = $(wildcard include/*.h)

# Archivos combinados
COMBINED_SRC = build/control.cpp
COMBINED_HDR = build/control.h

# Objetos
OBJ = build/control.o

default: build combine compile install

combine:
	for file in $(HDR); do cat $$file; echo ""; done > $(COMBINED_HDR)
	for file in $(SRC); do cat $$file; echo ""; done > $(COMBINED_SRC)

compile:
	g++ -fPIC -Ibuild -c $(COMBINED_SRC) -o $(OBJ) -Iinclude -lwiringPi -DDEV
	g++ -shared -o build/libcontrol.so $(OBJ)

# si la libreria ya existe, se sobreescribe
install:
	mv -f build/libcontrol.so /usr/lib/ 
	mkdir -p /usr/local/include
	cp $(COMBINED_HDR) /usr/local/include/control.h

build:
	mkdir -p build

clean:
	rm -rf build

#!/bin/bash

kpp gasbarth.kpp
make -f Makefile_gasbarth
./gasbarth.exe
python initcloud.py
chmod 644 initcloud.def
kpp aqbarth.kpp
make -f Makefile_aqbarth
./aqbarth.exe
python initgas.py
chmod 644 initgas.def
kpp gasbarth2.kpp
make -f Makefile_gasbarth2
./gasbarth2.exe

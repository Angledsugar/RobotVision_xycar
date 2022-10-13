#!/bin/bash

names=("car" "confirm" "game" "map" "resource" "tag" "wall")

sudo apt install cython*

for k in "${names[@]}"; 
do 
   echo $k
   cython3 -2 -a $k.py
   gcc -shared -pthread -fPIC -fwrapv -O2 -Wall -fno-strict-aliasing -I/usr/include/python2.7 -o $k.so $k.c
done

cython3 -2 --embed -o main.c main.py
gcc -Os -I /usr/include/python2.7 main.c -lpython2.7 -o main

sudo rm -rf ./*.c
sudo rm -rf ./*.html
sudo rm -rf ./*.py

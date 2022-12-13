#!/bin/bash
ls
echo "----------------------"
echo "file name without .asm: "
read name
NameWithAsm=$name.asm
NameWithO=$name.o
nasm -f macho64 $NameWithAsm

gcc -arch x86_64 -o $name $NameWithO
echo
echo "----------------------"
ls
echo "----------------------"

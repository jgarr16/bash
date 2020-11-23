#!/bin/bash

if compgen -G *.png
then
  for i in *.png
    do 
      mv $i $HOME/downloads/png/$i
    done
else
  printf "\nThere are no .png files...\n\n"
fi

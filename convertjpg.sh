#!/bin/bash

if compgen -G *.jpg || compgen -G *.jpeg || compgen -G *.JPG 
then
  for i in *.jpg *.jpeg *.JPG
    do
      base=${i%%.*}
      new_file=`magick convert "$i" $base".png" `
    done
else
  printf "\nThere are no .jpg files...\n\n"
fi

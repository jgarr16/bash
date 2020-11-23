#!/bin/bash

count=0;
if compgen -G *.jpg || compgen -G *.jpeg || compgen -G *.JPG 
then
  for i in *.jpg *.jpeg *.JPG 
    do 
      (( count++ ))
      mv "$i" `echo $i | tr ' ' '_'`
      echo $count - `echo $i | tr ' ' '_'`
    done
else
  printf "\nThere are no .jpg files...\n\n"
fi

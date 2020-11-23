#!/bin/bash

if compgen -G *.png
then
  for i in *.png
    do 
      mv "$i" `echo $i | tr ' ' '_'`
      echo $i
    done
  for j in *.png
    do 
      width=`magick identify -format "%[fx:w]" "$j"`
      height=`magick identify -format "%[fx:h]" "$j"`
      base=${j%%.*}
      new_name=$base"_"$width"x"$height".png"
      mv "$j" `echo $new_name`
      echo $new_name
    done
else
  printf "\nThere are no .png files...\n\n"
fi

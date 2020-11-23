#!/bin/bash

# this script combines jpg and png utilities:
# -- countjpg
# -- convertjpg
# -- rmjpg
# -- renamepng
# -- movepng

if compgen -G *.jpg || compgen -G *.jpeg || compgen -G *.JPG 
then
  countjpg
  convertjpg
  renamepng
  movepng
  rmjpg
  printf "\nAll done with the jpg files!\n\n"
else
  printf "\nNo jpg files - there's nothing to do here!\n\n"
fi

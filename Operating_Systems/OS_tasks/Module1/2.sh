#!/bin/bash



while true; do
  echo " 1 - nano, 2 - vi, 3 - links, 4 - 'exit'"
  read a

  case $a in 
    1 )
      echo "case 1, u entered 'nano'"
      nano
      ;;
    2 )
      echo "case 2, u entered 'vi'"
      vi
      ;;
    3)
      echo "case 3, u entered 'links'"
      links
      ;;
    4)
      echo "bye!"
      exit 0
      ;;
  esac
done

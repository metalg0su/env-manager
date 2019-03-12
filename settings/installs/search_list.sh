cat installed_list.txt | grep -v "ÀÚµ¿" | cut -d "," -f 1 | cut -d "/" -f 1 | cut -d ":" -f 2- >> installed_list_shorten.txt

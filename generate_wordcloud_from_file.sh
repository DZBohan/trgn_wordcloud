#!/usr/bin/bash
a=0
:>./current_pages/my_current.txt
while read -r param1; do
    ((a=$a+1))
    rm ./current_pages/file$a.html
    wget -crO ./current_pages/file$a.html $param1
    html2text.py ./current_pages/file$a.html >> ./current_pages/my_current.txt 
done <./my_webpages.txt
wordcloud_cli --mask ./mask.png --text ./current_pages/my_current.txt --imagefile ../../public_html/wordcloud.png

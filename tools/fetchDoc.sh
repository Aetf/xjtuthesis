#!/bin/bash
# download all wiki pages to the `doc` directory. need network access.
# multiple1902 <multiple1902@gmail.com>
# Licensed under GPL v3

echo "cleaning destination ..."
rm ../doc/*.html 2>/dev/null

echo "fetching the list ..."
for pagename in `curl "http://code.google.com/p/xjtuthesis/w/list" 2>/dev/null|grep "/p/xjtuthesis/wiki/"|sed -n -e 's/.*\/p\/xjtuthesis\/wiki\/\([^\?'\''"]*\).*/\1/p'|uniq`; do
    echo "downloading wiki page $pagename ..."
    curl "http://code.google.com/p/xjtuthesis/wiki/$pagename?show=content" 2>/dev/null | sed 's/<head>/<head><meta http-equiv="Content-Type" content="text\/html; charset=UTF-8">/' > ../doc/$pagename.html
done

echo "done :)"

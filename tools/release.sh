#!/bin/sh
# make a release zip archive
# multiple1902 <multiple1902@gmail.com>
# Licensed under GPL v3

# Derivation of mk-chrome-app.sh from Hotot. Thanks!

DESTROOT=release/
RELEASE=xjtuthesis

echo "Checking Version ..."
VER=$(sed  -n -e 's/\\def\\meta@version{\([0-9.]*\)}/\1/p' base/xjtuthesis.cls)
DEST=$RELEASE-$VER
echo "Version is $VER ... Sync ..."
rm -rf $DESTROOT$DEST/
mkdir -p $DESTROOT$DEST/
rsync -ar . $DESTROOT$DEST/ --exclude-from=.hgignore --exclude=".hg*" --copy-links

echo "Zip ..."
cd $DESTROOT
rm -f $DEST.zip
rm -f $DEST.zip.asc
zip -rq $DEST.zip $DEST
rm -rf $DEST
gpg -ab --sign $DEST.zip
cd - > /dev/null
echo "$DEST is ready"

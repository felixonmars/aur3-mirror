# Maintainer: Nguyễn Đình Quân <dinhquan[at]narga[dot]net>
pkgname=ecub
pkgver=1.12
pkgrel=2
pkgdesc="A simple to use EPUB and MobiPocket ebook creator."
url="http://www.juliansmart.com/ecub"
arch=('i686' 'x86_64')
license=('eCub END USER License')
optdepends=('kindlegen: To create prc ebook' 'epubcheck: Check your epub' 'calibre: Conversions utilities' 'lame: Generate MP3')
if test "$CARCH" == i686; then
  $CARCH == i386
fi
source=("http://www.anthemion.co.uk/ecub/eCub-${pkgver}-$CARCH.tar.gz")
md5sums=('d4a437bae67709e18a3b7f76d6323e9e')
[ "$CARCH" = "x86_64" ] && md5sums='1bc4943d746f851eb2deadba37a1204b'

package() {
    cd "$srcdir"
    if [ -d eCub ]; then
        rm -R eCub
    fi    
    mkdir eCub
    tar xvf eCubData.tar.gz --directory="$srcdir/eCub"
#Create lauch script
    echo "#!/bin/sh" > "$srcdir/ecub"
    echo "# A script to run eCub." >> "$srcdir/ecub"
    echo "WRITERSCAFEDIR=\"/usr/share/ecub\"" >> "$srcdir/ecub"
    echo "\"/usr/share/ecub\"/ecub \"\$@\"" >> "$srcdir"/ecub
    chmod a+x "$srcdir"/ecub
    install -D "$srcdir/ecub" "$pkgdir/usr/bin/ecub"
    install -D "$srcdir/eCub/ecub.keys"  "$pkgdir/usr/share/mime-info/ecub.keys"
    install -D "$srcdir/eCub/ecub.mime"  "$pkgdir/usr/share/mime-info/ecub.mime"
    install -D "$srcdir/eCub/ecub.xml"  "$pkgdir/usr/share/mime/packages/ecub.xml"
    install -D "$srcdir/eCub/appicons/ecub48x48.png"  "$pkgdir/usr/share/pixmaps/ecub.png"
    for EACHSIZE in 16 22 32 48 128 ; do
        SIZEDIR="$pkgdir/usr/share/icons/hicolor/${EACHSIZE}x${EACHSIZE}/apps"
        MIMESIZEDIR="$pkgdir/usr/share/icons/hicolor/${EACHSIZE}x${EACHSIZE}/mimetypes"
        mkdir -p "$SIZEDIR"
        mkdir -p "$MIMESIZEDIR"
    if [ -d "$SIZEDIR" ] ; then
        if [ -f "$pkgdir/usr/share/appicons/ecub${EACHSIZE}x${EACHSIZE}.png" ]; then
        cp -f "$pkgdir/usr/share/appicons/ecub${EACHSIZE}x${EACHSIZE}.png" "$SIZEDIR/ecub.png"
        fi
    for EACHTYPE in ebkproj ; do

          if [ -f "$srcdir/eCub/appicons/ecub_${EACHTYPE}${EACHSIZE}x${EACHSIZE}.png" ] ; then
            cp -f "$srcdir/eCub/appicons/ecub_${EACHTYPE}${EACHSIZE}x${EACHSIZE}.png" $MIMESIZEDIR/application-x-ecub${EACHTYPE}.png
            cp -f "$srcdir/eCub/appicons/ecub_${EACHTYPE}${EACHSIZE}x${EACHSIZE}.png" $MIMESIZEDIR/gnome-mime-application-x-ecub${EACHTYPE}.png
          fi
        done
      fi
    done
    mv $srcdir/eCub $pkgdir/usr/share/ecub
    install -D "$pkgdir/usr/share/ecub/ecub.desktop" "$pkgdir/usr/share/applications/ecub.desktop"
}

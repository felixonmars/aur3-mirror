# Contributor: Frank Ickstadt (frank dot ickstadt at gmail dot com)
# For Konica Minolta magicolor 2430 Desklaser
 
pkgname=cups-mc2430dl
pkgver=1.6.0
pkgrel=2
pkgdesc="CUPS driver for Konica Minolta magicolor 2430 Desklaser printer"
url="http://konicaminolta.com/"
license="GPL"
arch=(any)
depends=('libcups' 'ghostscript' 'lcms' 'jbigkit')
source=(http://www.openprinting.org/download/printing/konicaminolta/magicolor2430DL-$pkgver.tar.gz)
md5sums=('a97b4ee5c949ca791764457ead3a5b9c')
 
build() {
        cd $startdir/src/magicolor2430DL-$pkgver
        sed -i '/KM_PPDDIR/s#/usr/share/cups/model/KONICA_MINOLTA#"$datadir/cups/model"#' ./configure
        sed -i "/KM_DATADIR/s#KONICA_MINOLTA/mc2430DL#$pkgname#" ./configure
        ./configure --prefix=$startdir/pkg/usr
        make CFLAGS="$CFLAGS -lm" || return 1
        make install || return 1
        rm $startdir/pkg/usr/share/cups-mc2430dl/COPYING
}

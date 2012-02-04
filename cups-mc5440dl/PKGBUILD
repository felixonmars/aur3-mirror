# Contributor: Frank Ickstadt (frank dot ickstadt at gmail dot com)
# For Konica Minolta magicolor 5440 Desklaser

pkgname=cups-mc5440dl
pkgver=1.2.0
pkgrel=1
pkgdesc="CUPS driver for Konica Minolta magicolor 5440 Desklaser printer"
arch=(i686 x86_64)
url="http://konicaminolta.com/"
license="GPL"
depends=('libcups' 'ghostscript' 'lcms' 'jbigkit')
source=(http://www.openprinting.org/download/printing/konicaminolta/magicolor5440DL-$pkgver.tar.gz)
md5sums=('abd54f32517ebeb7a56f902b159c7dea')

build() {
	cd $startdir/src/magicolor5440DL-$pkgver
	sed -i 's/cups_strlcpy/_cups_strlcpy/' ./src/kmlf.h
	sed -i '/KM_PPDDIR/s#/usr/share/cups/model/KONICA_MINOLTA#"$datadir/cups/model"#' ./configure
	sed -i "/KM_DATADIR/s#KONICA_MINOLTA/mc5440DL#$pkgname#" ./configure
        ./configure --prefix=$startdir/pkg/usr
        make || return 1
        make install || return 1
	rm $startdir/pkg/usr/share/cups-mc5440dl/COPYING
}

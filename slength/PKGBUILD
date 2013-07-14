# Maintainer: Alexej Magura <agm2819*gmail*>

pkgname=slength 
_pkgname=slen
pkgver=2.1.1
pkgrel=1
pkgdesc="a program that returns the length of user supplied strings"
arch=('any')
url="https://sourceforge.net/projects/slength/"
license=('GPL3')
depends=('ruby')
source=("http://sourceforge.net/projects/slength/files/$pkgver/$_pkgname-${pkgver}.tar.gz/download")
md5sums=('dd7884e120d922643d4fc366d612ed3e')

package() {
    cd $srcdir/$_pkgname-$pkgver

    install -d $pkgdir/usr/{bin,share/doc/$pkgname/}

    for files in $(ls -1 docs/) 
    do
	install -m 644 docs/$files $pkgdir/usr/share/doc/$pkgname/$files 
    done 

    install -m 755 ${_pkgname}.rb $pkgdir/usr/bin/$_pkgname

}

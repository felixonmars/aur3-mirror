# Maintainer: Vinilox <vinilox@vinilox.eu>
 
pkgname=ifstatus
pkgver=1.1.0
pkgrel=1
pkgdesc="network interface status monitor with graphical statistics"
arch=('any')
url="http://ifstatus.sourceforge.net/"
license=('GPL')
depends=('ncurses' 'libstdc++5')
source=(http://ifstatus.sourceforge.net/download/$pkgname-v$pkgver.tar.gz)
md5sums=('f4d413f880754fd6677290160f8bc5d7')
 
build() {
 	cd "$srcdir/${pkgname}"
        sed -i '26i #include <stdlib.h>' Main.h
        make
        install -d $pkgdir/usr/bin
        install -d $pkgdir/usr/share/doc/${pkgname}
        install -m 755 $srcdir/${pkgname}/$pkgname $pkgdir/usr/bin/
        install -m 644 $srcdir/${pkgname}/README $pkgdir/usr/share/doc/${pkgname}/README
}

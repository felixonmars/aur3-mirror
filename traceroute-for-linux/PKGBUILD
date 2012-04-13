# Maintainer: Chih-mao Chen <pkmx.tw@gmail.com>

pkgname=traceroute-for-linux
_srcpkgname=traceroute
pkgver=2.0.18
pkgrel=1
pkgdesc="Traceroute for linux"
arch=('i686' 'x86_64')
url="http://traceroute.sourceforge.net/"
license=('GPL')
depends=('glibc')
source=(http://downloads.sourceforge.net/$_srcpkgname/$_srcpkgname-$pkgver.tar.gz)

build() {
    cd "$srcdir/$_srcpkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$_srcpkgname-$pkgver/traceroute"
    install -Dps -m755 traceroute $pkgdir/usr/bin/$pkgname
    install -Dp -m644 traceroute.8 $pkgdir/usr/share/man/man8/$pkgname.8
}

md5sums=('b7254149b7f081cce07f4b9e065ba5ef')

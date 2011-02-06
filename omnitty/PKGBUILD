# Maintainer: Carlos Eduardo Moreira dos Santos <cems@cemshost.com.br>
pkgname=omnitty
pkgver=0.3.0
pkgrel=2
pkgdesc="Omnitty SSH Multiplexer"
arch=(i686 x86_64)
url="http://omnitty.sourceforge.net"
license=('GPL')
depends=('rote')
source=(http://downloads.sourceforge.net/omnitty/omnitty-${pkgver}.tar.gz)
md5sums=('5d35c4dfdc3194de94527e28a27d8461')

build() {
    cd $srcdir/omnitty-0.3.0
    ./configure --prefix=/usr
    make || return 1
    make DESTDIR=$pkgdir install || return 1
}

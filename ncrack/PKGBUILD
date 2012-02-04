# Maintainer: mickael9 <mickael9 at gmail dot com>

pkgname=ncrack
pkgver=0.4a
_realver=0.4ALPHA
pkgrel=1
pkgdesc='A high-speed network authentication cracking tool.'
arch=(i686 x86_64)
url='http://nmap.org/ncrack/'
license=(GPL)
depends=(openssl)
makedepends=(gcc)
source=("http://nmap.org/ncrack/dist/ncrack-${_realver}.tar.gz")
md5sums=('db9be165469c04650ddc7403b29eb472')

build() {
    cd $srcdir/$pkgname-${_realver}
    ./configure --prefix=/usr
    make || exit 1
    make install DESTDIR=$pkgdir
}

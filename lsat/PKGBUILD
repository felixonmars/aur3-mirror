# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Sven Kauber <celeon@gmail.com>

pkgname=lsat
pkgver=0.9.7.1
pkgrel=1
pkgdesc="A post install security auditor for Linux/Unix"
arch=('i686' 'x86_64')
url="http://usat.sourceforge.net/"
license=('GPL')
depends=('popt')
optdepends=('nmap' 'lsof')
source=(http://usat.sourceforge.net/code/$pkgname-$pkgver.tgz)
md5sums=('441defd1f7f82c5eccd3b5a9f46fe5fa')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man || return 1
  make || return 1
  make manpage || return 1
  make \
    DESTDIR="$pkgdir" \
    INSTALL=/bin/install \
    install installman || return 1
}

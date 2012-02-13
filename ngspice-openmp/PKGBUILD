# Maintainer: Matteo Agostinelli <agostinelli@gmail.com>

_pkgname=ngspice
pkgname=ngspice-openmp
pkgver=24
pkgrel=1
pkgdesc="Mixed-level/Mixed-signal circuit simulator based on Spice3f5, Ciber1b1, and Xspice. Optimized for multi-core processors."
url="http://ngspice.sourceforge.net"
license=('BSD')
arch=('i686' 'x86_64')
depends=('libxaw' 'libedit')
replaces=('ngspice')
conflicts=('ngspice')
source=(http://downloads.sourceforge.net/ngspice/$_pkgname-$pkgver.tar.gz)
md5sums=('e9ed7092da3e3005aebd892996b2bd5f')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./configure --prefix=/usr \
              --mandir=/usr/share/man \
              --infodir=/usr/share/info \
              --enable-xspice \
              --with-editline=yes \
              --enable-openmp \
              --enable-x
  make || return 1
  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || return 1
  # rm "$pkgdir/usr/share/info/dir" || return 1
}

# Contributor: lynix <lynix47@googlemail.com>
# Maintainer: lynix <lynix47@googlemail.com>

pkgname=kshowmail
pkgver=4.1
pkgrel=1
pkgdesc="KShowmail is a POP3 mail checker for the KDE"
arch=('i686' 'x86_64')
url="http://kshowmail.sourceforge.net"
license=('GPL')
depends=('kdebase-lib>=4.0.0' 'kdepimlibs>=4.0.0')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('a928806ccfe63b8d409dcfe975bff57c')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix) .. || return 1
  make || return 1
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

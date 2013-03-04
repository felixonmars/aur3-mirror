# Maintainer: mar77i <mysatyre@gmail.com>
_pkgname=DiskImagery64
pkgname=diskimagery64
pkgver=0.7
pkgrel=1
pkgdesc="DiskImagery64 is a portable (Qt-based), open-source disk image editor for Commodore 64 disk images."
arch=('i686' 'x86_64')
url="http://lallafa.de/blog/diskimagery64/"
license=('GPL')
depends=(qt4)
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$_pkgname-$pkgver-src.zip" dist_version.patch)
md5sums=('d7911c12d1069740c65cd376964fbd1e'
         'c8dd75bfbb3624e9383189b0e21b2037')

build() {
  cd "$srcdir"
  patch -Np1 <dist_version.patch
  qmake
  make
}

check() {
  cd "$srcdir"
  make -k check
}

package() {
  cd "$srcdir"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

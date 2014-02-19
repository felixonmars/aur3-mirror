# Contributor: Marius Dransfeld <marius.dransfeld@googlemail.com>
# Contributor: Daniel Albers <daniel@lbe.rs>
pkgname=basket-uuids
_pkgname="basket"
pkgver=1.81.r143.g6d42dd4
pkgrel=1
pkgdesc="All-purpose notes taker for KDE - Patched to use UUIDs for file names and directories in order to work in distributed environments, i. e. when using a DVCS like git."
arch=(i686 x86_64)
url="http://gitorious.org/basket"
license=('GPL')
provides=('basket')
depends=('kdelibs>=4.4' 'qimageblitz' 'gpgme')
makedepends=('cmake>=2.6.2' 'automoc4' 'git')
conflicts=('basket' 'basket-git')
source=("git+https://github.com/AlD/basket.git#branch=uuids")
md5sums=('SKIP')

# template start; name=git-pkgver-r; version=1.0;
pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --tags --long | sed -E 's/([^-]+-g)/r\1/;s/-/./g;s/^v//g'
}
# template end;

build() {
  cd "$srcdir/$_pkgname"

  cmake -DCMAKE_INSTALL_PREFIX=$( kde4-config --prefix ) \
  -DCMAKE_BUILD_TYPE=Release ../$_pkgname \
  -DAutomoc4_DIR=/usr/lib/automoc4

  make
}
package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR=$pkgdir install
}

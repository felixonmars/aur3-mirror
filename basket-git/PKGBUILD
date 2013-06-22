# Contributor: Marius Dransfeld <marius.dransfeld@googlemail.com>
pkgname=basket-git
_pkgname="basket"
pkgver=1.81.r142.g6d489cb
pkgrel=1
pkgdesc="All-purpose notes taker for KDE - git version."
arch=(i686 x86_64)
url="http://gitorious.org/basket"
license=('GPL')
provides=()
depends=('kdelibs>=4.4' 'qimageblitz' 'gpgme')
makedepends=('cmake>=2.6.2' 'automoc4' 'git')
conflicts=('basket')
source=("git://gitorious.org/basket/basket.git")
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

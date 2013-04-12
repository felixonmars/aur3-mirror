# Maintainer: mmm
# Contributor: yimm

pkgname=akonadi-facebook-git
pkgver=20121226
pkgrel=2
pkgdesc="An Akonadi resource for Facebook Resource"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/pim/akonadi-facebook"
license=('GPL')
depends=('kdepimlibs' 'libkfbapi')
provides=('akonadi-facebook')
makedepends=('git' 'cmake' 'qjson' 'boost' 'automoc4')
source=('git+git://anongit.kde.org/akonadi-facebook')
sha1sums=('SKIP')
_gitname=akonadi-facebook

build() {
  cd "$srcdir"
  cmake ${_gitname} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make
}

package() {
  cd "$srcdir"
  make DESTDIR="$pkgdir" install
} 


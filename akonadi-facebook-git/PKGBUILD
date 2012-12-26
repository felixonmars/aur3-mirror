# Maintainer: mmm
# Contributor: yimm

pkgname=akonadi-facebook-git
pkgver=20121226
pkgrel=1
pkgdesc="An Akonadi resource for Facebook Resource"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/pim/akonadi-facebook"
license=('GPL')
depends=('kdepimlibs')
provides=('akonadi-facebook')
makedepends=('git' 'cmake' 'qjson' 'boost' 'automoc4')

_gitroot="git://anongit.kde.org/akonadi-facebook"
_gitname="akonadi-facebook"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/build"
  mkdir "$srcdir/build"
  cd "$srcdir/build"

  cmake ../${_gitname} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
} 

# Maintainer: Justin Gottula <justin@jgottula.com>
pkgname=kdebase-konsole-git
pkgver=20110911
pkgrel=1
arch=('i686' 'x86_64')
url='http://kde.org/applications/system/konsole/'
pkgdesc="Terminal"
license=('GPL' 'LGPL' 'FDL')
groups=('kde' 'kdebase')
depends=('kdebase-runtime')
makedepends=('cmake' 'automoc4')
provides=('kdebase-konsole')
conflicts=('kdebase-konsole')
source=()
sha1sums=()

_gitroot="git://anongit.kde.org/konsole"
_gitname="konsole"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/$_gitname-build"
  make DESTDIR="${pkgdir}" install
}

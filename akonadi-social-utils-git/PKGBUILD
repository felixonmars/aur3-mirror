# Maintainer: Thaodan <theodorstormgrade@gmail.com>

pkgname=akonadi-social-utils-git
pkgver=20121004
pkgrel=1
pkgdesc="akonadi-social-utils git"
arch=('i686' 'x86_64')
url="http://quickgit.kde.org/index.php?p=scratch%2Fmklapetek%2Fakonadi-social-utils.git&a=summary"
license=('GPL')
depends=('kdepimlibs')
makedepends=('git' 'cmake' 'qjson' 'boost')

_gitroot='git://anongit.kde.org/scratch/mklapetek/akonadi-social-utils.git'
_gitname="akonadi-social-utils"

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


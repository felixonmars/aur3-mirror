# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=('kdbg-git')
pkgver=20111214
pkgrel=1
pkgdesc="A gdb GUI for KDE (git version)"
arch=('i686' 'x86_64')
depends=('kdelibs' 'gdb')
makedepends=('cmake' 'automoc4' 'git')
url="http://www.kdbg.org"
license=('GPL')
conflicts=('kdbg')

_gitroot="git://repo.or.cz/kdbg.git"
_gitname="kdbg"

build() {
 msg "Connecting to kdbg GIT server...."

  if [ -d $srcdir/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  # Cleanup and prepare the build dir
  rm -rf $srcdir/$_gitname-build
  cp -r $srcdir/$_gitname $srcdir/$_gitname-build

  cd $srcdir/$_gitname-build

  cmake -DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd $srcdir/$_gitname-build

  make DESTDIR="$pkgdir" install
}

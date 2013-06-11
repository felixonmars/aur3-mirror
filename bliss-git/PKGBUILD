pkgname=bliss-git
pkgver=20130322
pkgrel=1
pkgdesc="TODO app to showcase user interfaces"
arch=('i686' 'x86_64')
url="http://quickgit.kde.org/?p=scratch%2Fcschumac%2Fbliss.git"
license=('GPL2')
depends=('kdebase-runtime')
makedepends=('cmake' 'automoc4' 'git')

_gitroot="git://anongit.kde.org/scratch/cschumac/bliss.git"
_gitname='bliss'

build() {
  cd "$srcdir"

  msg "Connecting to GIT server...."

  if [ -d "$srcdir/$_gitname" ] ; then
    cd $_gitname
    git config remote.origin.url $_gitroot
    git pull origin
    msg "The local files are updated."
    cd ../
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf build
  mkdir build
  cd build

  cmake ../$_gitname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DQT_QMAKE_EXECUTABLE=qmake4 
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install
}

pkgname=phonon-quicktime-git
pkgver=20130123
pkgrel=1
pkgdesc="Phonon QuickTime backend, git version"
arch=('i686' 'x86_64')	
url="https://projects.kde.org/projects/unmaintained/phonon-quicktime"
license=('LGPL')
depends=('phonon' )
makedepends=('git' 'automoc4' 'cmake' 'phonon')
provides=('phonon-quicktime' 'phonon-backend')
source=(phonon-qt7-noshow.patch)

_gitroot="git://anongit.kde.org/phonon-quicktime"
_gitname="phonon-quicktime"

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

  rm -rf "$srcdir/$_gitname-build"
  git clone -l "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  patch -Np1 -i ../phonon-qt7-noshow.patch
  cmake -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix) \
        -DCMAKE_BUILD_TYPE=Release \
        ../${_gitname}
  make
  make DESTDIR=$pkgdir install
  rm -rf "$srcdir/$_gitname-build"
} 

md5sums=('9985bb34557a4b80e6d6f66940c01357')

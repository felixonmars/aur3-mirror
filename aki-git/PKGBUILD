# Contributor: Martin T. Sandsmark <martin.sandsmark@kde.org>
# Maintainer: (epsilom) Xavier Corredor <xavier.corredor.llano (a) gmail.com>

pkgname=aki-git
pkgver=20110117
pkgrel=1
pkgdesc="Aki is a multi-panel IRC-client"
arch=('x86_64' 'i686')
url="http://akiirc.org/"
license=('LGPL2.1')
groups=()
depends=('kdelibs>=4.5' 'qt>=4.7')
makedepends=('git')
provides=('aki')
conflicts=('aki')
replaces=('aki')
source=()
md5sums=()

_gitroot="git://anongit.kde.org/aki"
_gitname="aki"

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
  mkdir "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  cmake "$srcdir/$_gitname" -DCMAKE_BUILD_PREFIX=/usr || return 1
  make VERBOSE=1 || return 1
  make DESTDIR="$pkgdir/" install
} 

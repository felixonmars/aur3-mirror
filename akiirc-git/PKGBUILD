# Contributor: Martin T. Sandsmark <martin.sandsmark@kde.org>

pkgname=akiirc-git
pkgver=20100128
pkgrel=1
pkgdesc="AkiIrc is an IRC library, mainly used by the Aki IRC client."
arch=('x86_64' 'i686')
url="http://akiirc.org/"
license=('LGPL2.1')
groups=()
depends=('kdelibs>=4.3.80' 'qt>=4.6' 'kdebindings-python>=4.3.80')
makedepends=('git')
provides=('akiirc')
conflicts=('akiirc')
replaces=('akiirc')
source=()
md5sums=()

_gitroot="git://gitorious.org/aki/akiirc.git"
_gitname="akiirc"

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

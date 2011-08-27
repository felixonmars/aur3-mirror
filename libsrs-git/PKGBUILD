# Maintainer: Markus Jochim <dev@markusjochim de>
pkgname=libsrs-git
pkgver=20100306
pkgrel=2
pkgdesc="C++ interface to speech recognition and speech synthesizing"
arch=('i686' 'x86_64')
url="http://www.markusjochim.de/libsrs"
license=('custom: ISC' 'BSD')
depends=('pocketsphinx' 'flite')
makedepends=('git')
provides=('libsrs')
conflicts=('libsrs')

_gitroot="git://git.supraverse.net/libsrs.git"
_gitname="libsrs"

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
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  #./autogen.sh
  #./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}


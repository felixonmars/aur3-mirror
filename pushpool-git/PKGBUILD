# Contributor: Nicolas Pouillard (http://nicolaspouillard.fr)
pkgname=pushpool-git
_pkgname=pushpool
pkgver=20110705
pkgrel=1
pkgdesc="Peer-to-peer network based digital currency."
arch=('i686' 'x86_64')
url="https://github.com/jgarzik/pushpool"
depends=('libevent' 'libmemcached' 'glibc' 'zlib' 'jansson' 'openssl' 'curl')
makedepends=('git')
license=('GPL2')

_gitroot="https://github.com/jgarzik/pushpool.git"
_gitname="pushpool"
_gitbranch=master

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin $_gitbranch
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname -b $_gitbranch
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build" -b $_gitbranch
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make install DESTDIR="$pkgdir/"
}

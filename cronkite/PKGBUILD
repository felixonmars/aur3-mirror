# Maintainer: Andres Perera <andres87p@gmail.com>
pkgname=cronkite
pkgver=20100125
pkgrel=1
pkgdesc='Simple AUR json fetcher/preparser'
arch=(i686 x86_64)
url=http://github.com/cactus/$pkgname
license=(APACHE)
makedepends=(asciidoc cmake git)
depends=(curl)

_gitroot=git://github.com/cactus/$pkgname.git
_gitname=$pkgname

build() {
  msg 'Connecting to github GIT server...'

  if [[ -d $_gitname ]] ; then
    (cd $_gitname; git pull)
  else
    git clone $_gitroot
  fi
  
  msg 'GIT checkout done or server timeout'
  msg 'Starting make...'

  rm -rf build
  mkdir build
  cd build
  
  cmake ../$_gitname -DNOGZIP=ON -DCMAKE_INSTALL_PREFIX=/usr
  make || return 1
  make DESTDIR=$pkgdir install
}


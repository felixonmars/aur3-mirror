# Maintainer: Alf <naihe2010@126.com>

pkgname=libttdht

pkgver=20110706

pkgrel=1
pkgdesc='DHT C library'
arch=('i686' 'x86_64')
url='http://naihe2010.github.com/libttdht/index.html'
license=('GPLv2')
depends=('openssl')
makedepends=('git')

_gitroot='http://github.com/naihe2010/libttdht.git'
_gitname='libttdht'

build() {
  cd "$srcdir"

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
  else
    git clone $_gitroot
    cd $_gitname
  fi

  sh autogen.sh && ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install

  make clean
}

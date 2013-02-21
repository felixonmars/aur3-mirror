# Maintainer: Darcy Shen <sadhen1992@gmail.com>
# Author: Victor Lavaud <victor.lavaud@gmail.com>

pkgname=tatoparser-git
pkgver=20130221
pkgrel=1
pkgdesc="A parser for tatoeba.org's database dumps"
arch=('i686' 'x86_64')
url="https://github.com/qdii/tatoeba_parser"
license=('GPL')
depends=('boost' 'boost-libs')
optdepends=('tato-data')
md5sums=()

_gitroot="https://github.com/qdii/tatoeba_parser.git"
_gitname="tatoeba_parser"

build() {
  mkdir -p $srcdir/$pkgname-$pkgver
  cd "$srcdir/$pkgname-$pkgver"
  msg "connecting to git server..."
  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "local files have been updated"
  else
    msg "cloning git repo..."
    git clone $_gitroot
  fi
  msg "git checkout done"
  msg "starting make..."

  cd "$srcdir/$pkgname-$pkgver/$_gitname"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/$_gitname"
  make DESTDIR="$pkgdir" install
}
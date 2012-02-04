#contributor: alzen<mynick2(at)gmail(dot)com>
pkgname=wmget
pkgver=0.6.0
pkgrel=1
pkgdesc="wmget is a dock app for the Window Maker  window manager which makes it more convenient to perform long downloads in the background. Middle click it and it downloads your clipboard's URL."
url="http://amtrickey.net/wmget/index.html"
license="GPL"
depends=('glibc' 'x-server' 'curl')
makedepends=('make')
source=(http://amtrickey.net/download/wmget-0.6.0-src.tar.gz patch)
md5sums=('f4f196f3cf1c427e1f8321b4063c4917' 'a0de51efce1ad1f36a5634123d8713cb')

build() {
  cd $startdir/src/$pkgname
  patch -p0 < ../patch
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}

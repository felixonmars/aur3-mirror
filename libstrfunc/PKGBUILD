# Contributor: Christoph Zeiler <rabyte*gmail>
# Maintainer: Lajos Kovacs <klajos at archlinux us>

pkgname=libstrfunc
pkgver=2.0.0
pkgrel=1.1
pkgdesc="A C library providing a collection of string-based functions"
arch=('i686' 'x86_64')
url="http://www.wolf-software.com"
license=('GPL3')
depends=('liblogfile>=1.2')
options=('!libtool' '!emptydirs')
source=()
_md5sums=('9c9be9e177e7d1eab3db810088829b64')

build() {
  wget $url/download.php?f=$pkgname.tbz2 --referer=$url -O $pkgname.tbz2
  echo $_md5sums $pkgname.tbz2|md5sum -c -

  tar xvvf $pkgname.tbz2

  cd $pkgname-$pkgver

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}

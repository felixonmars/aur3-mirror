# Contributor: Christoph Zeiler <rabyte*gmail>
# Maintainer: Lajos Kovacs <klajos at archlinux us>

pkgname=libbacktrace
pkgver=3.0.0
pkgrel=1.2
pkgdesc="A C library replicating the bt functionality from gdb, allowing function stack tracing"
arch=('i686' 'x86_64')
url="http://www.wolf-software.com"
license=('GPL3')
depends=('liblogfile>=3')
options=('!libtool')
source=()
_md5sums=('b214bb049330f8928d877bd43ba23af9')

build() {
  wget $url/download.php?f=$pkgname.tbz2 --referer=$url -O $pkgname.tbz2
  echo $_md5sums $pkgname.tbz2|md5sum -c -

  tar xvvf $pkgname.tbz2

  cd $pkgname-$pkgver

  sed 's|-Werror||g' -i configure

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}

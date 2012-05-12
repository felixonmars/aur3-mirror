# Contributor: Christoph Zeiler <rabyte*gmail>
# Maintainer: Lajos Kovacs <klajos at archlinux us>

pkgname=libsocklib
pkgver=3.0.0
pkgrel=1.2
pkgdesc="A C library providing a selection of socket functions"
arch=('i686' 'x86_64')
url="http://www.wolf-software.com"
license=('GPL3')
depends=('liblogfile')
options=('!libtool')
source=()
_md5sums=('7b7fb0c934df79467f5b047b235d29bd')

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

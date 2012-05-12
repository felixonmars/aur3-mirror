# Contributor: Christoph Zeiler <rabyte*gmail>
# Maintainer: Lajos Kovacs <klajos at archlinux us>

pkgname=liblogdb
pkgver=3.0.1
pkgrel=1.4
pkgdesc="A C library providing a basic logging function into a mysql database"
arch=('i686' 'x86_64')
url="http://www.wolf-software.com"
license=('GPL3')
depends=('libmysqlclient')
options=('!libtool')
source=()
_md5sums=('a09d4f8749691aa8d659a59f940ad3f4')

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

# Contributor: Christoph Zeiler <rabyte*gmail>
# Maintainer: Lajos Kovacs <klajos at archlinux us>

pkgname=libgll
pkgver=3.0.0
pkgrel=1.2
pkgdesc="A C library providing generic linked list support"
arch=('i686' 'x86_64')
url="http://www.wolf-software.com"
license=('GPL3')
depends=('liblogfile' 'liblogdb')
options=('!libtool')
source=()
_md5sums=('53ce02e02797115746411fecb2967967')

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

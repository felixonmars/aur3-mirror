# Contributor: Christoph Zeiler <rabyte*gmail>
# Maintainer: Lajos Kovacs <klajos at archlinux us>

pkgname=liblogfile
pkgver=3.0.1
pkgrel=1.3
pkgdesc="A C library providing a basic logging function"
arch=('i686' 'x86_64')
url="http://www.wolf-software.com"
license=('GPL3')
depends=('glibc')
options=('!libtool')
source=()
_md5sums='cfd0e9204e89edfcd4d780036f83208d'

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

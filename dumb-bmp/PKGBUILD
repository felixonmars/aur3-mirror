# $Id$
# Contributor: Klerik <klerik@inmail.cz>
pkgname=dumb-bmp
pkgver=0.9.3
pkgrel=1
pkgdesc="Support IT, XM, S3M and MOD audio format for BMP"
url="http://www.sosdg.org/~larne/w/Plugin_list"
depends=('dumb')
source=(http://mitglied.lycos.de/mldoering/dumb-bmp.tar.bz2)
md5sums=ee36cc2bd4f9d6e7623d6f7b4b438210

build() {
  cd $startdir/src/$pkgname

  make

  # Create directories
  mkdir -p $startdir/pkg/usr/lib/bmp/Input

  cp -f libdumb-bmp.so $startdir/pkg/usr/lib/bmp/Input
}

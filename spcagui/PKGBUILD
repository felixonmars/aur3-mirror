# Contributor: Cook Green (tgc) <dell2009123@gmail.com>
pkgname=spcagui
pkgver=1.1.2
_pkgdate=20060127
pkgrel=1
pkgdesc="Spcagui, spcaserv and spcacat is a set of tools for viewing, streaming and capturing video from webcams"
url="http://mxhaard.free.fr/"
arch=('i686' 'x86_64')
license=('gpl')
source=(http://mxhaard.free.fr/spca50x/Download/spcagui$_pkgdate.tar.gz)
md5sums=('SKIP')
depends=(sdl sdl_image)

build() {
  cd $startdir/src/$pkgname$_pkgdate
  make || return 1
  sed -i s\%BIN=/usr/local/bin%BIN=$startdir/pkg/usr/bin% Makefile
  mkdir -p $startdir/pkg/usr/bin
  make
}
package() {
  cd $startdir/src/$pkgname$_pkgdate
  make install
}

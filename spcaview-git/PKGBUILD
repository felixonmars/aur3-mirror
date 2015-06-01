# Contributor[Create]: Tomas Groth (tgc) <tomasgroth # yahoo.dk>
# Contributor[Modify]: Cook Green (tgc) <dell2009123@gmail.com>
pkgname=spcaview-git
pkgver=1.1.9
_pkgdate=20071224
pkgrel=2
pkgdesc="Spcaview, spcaserv and spcacat is a set of tools for viewing, streaming and capturing video from webcams"
url="http://mxhaard.free.fr/"
arch=('i686' 'x86_64')
license=('gpl')
source=(http://mxhaard.free.fr/spca50x/Download/spcaview-$_pkgdate.tar.gz)
md5sums=('12e46424844b937dd55eab28f74bcd8d')
depends=(sdl sdl_image)

build() {
  cd $startdir/src/$pkgname-$_pkgdate
  make || return 1
  sed -i s\%BIN=/usr/local/bin%BIN=$startdir/pkg/usr/bin% Makefile
  mkdir -p $startdir/pkg/usr/bin
  make
}
package() {
  cd $startdir/src/$pkgname-$_pkgdate
  make install
}

# Contributor: rabyte <rabyte.at.pen.dot.tj>

pkgname=huc
pkgver=3.21
pkgrel=1
pkgdesc="HuC is a PC Engine C compiler which can create ROMs (hucard) or CD images"
arch=('i686')
url="http://www.zeograd.com/parse.php?src=hucf&path=0,2,"
license=('unknown')
install=$pkgname.install
source=(http://www.zeograd.com/download/$pkgname-$pkgver-src.zip \
	Make_src.inc.diff \
	huc.sh)
md5sums=('ddb0d24a33542390bad2b84a56357b7a' '63c77f9eb504afe79ec3dc6d188aabce'
	 '7caad100e1ebc4a9632edefb100e0c3f')

build() {
  cd $startdir/src

  patch -Np0 -i Make_src.inc.diff || return 1

  make || return 1

  mkdir -p $startdir/pkg/usr/share/huc
  cp -rf bin/ include/ $startdir/pkg/usr/
  cp -rf doc/ $startdir/pkg/usr/share/huc/

  install -m755 -D ../huc.sh $startdir/pkg/etc/profile.d/huc.sh
}

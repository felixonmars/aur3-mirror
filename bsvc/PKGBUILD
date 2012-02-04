# Contributor: Lawrence Lee <valheru@facticius.net>
pkgname=bsvc
pkgver=2.1
pkgrel=5
pkgdesc="BSVC is a microprocessor simulation framework written in C++ and Tcl/Tk"
arch=('i686')
url="http://www.bradfordmott.com/bsvc/"
license=('GPL')
depends=('tk' 'tcl' 'gcc')
source=(http://www.bradfordmott.com/bsvc/distributions/$pkgname-$pkgver-src.tar.gz bsvc-2.1.patch bsvc.sh)
md5sums=('5997ba10e2d16b5913851ce2ee360354'
         '57b64b9f8aca3010f5cf4bf44ba82fec'
         '9bf20e19ee3bf1a0f068c3f06a9dd61d')

build() {
  cd $startdir/src/
  patch -p0 -i bsvc-2.1.patch
  cd $pkgname-$pkgver/src
  make -f Makefile.Linux || return 1
  make -f Makefile.Linux INSTALL_DIR=$startdir/pkg/opt/bsvc install

  sed -e 's|exec wish -f /usr/src/bsvc/src/bsvc-2.1/bin/UI/bsvc.tk|exec wish -f /opt/bsvc/UI/bsvc.tk|' \
	-i $startdir/pkg/opt/bsvc/bsvc
  sed -r 's|/usr/src/bsvc/src/bsvc-2.1/bin|/opt/bsvc|' -i $startdir/pkg/opt/bsvc/UI/bsvc.tk
  cp -rf $startdir/src/$pkgname-$pkgver/doc $startdir/pkg/opt/bsvc
  cp -rf $startdir/src/$pkgname-$pkgver/misc $startdir/pkg/opt/bsvc
  cp -rf $startdir/src/$pkgname-$pkgver/samples $startdir/pkg/opt/bsvc
  mkdir -p $startdir/pkg/etc/profile.d
  install -D -m755 $startdir/src/bsvc.sh $startdir/pkg/etc/profile.d/
}

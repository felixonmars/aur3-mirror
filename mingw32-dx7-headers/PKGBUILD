# Contributor: rabyte <rabyte__gmail>
# Contributor: Alexander Jakopin <setrodox@users.sourceforge.net>
# Maintainer: Matěj Týč <bubla@users.sourceforge.net>

pkgname=mingw32-dx7-headers
pkgver=7.0
pkgrel=3
pkgdesc="Minimal DirectX 7 SDK for MinGW (headers only)"
arch=('any')
url="http://msdn.microsoft.com/directx/"
license=('unknown')
depends=('mingw32-gcc')
source=(http://alleg.sourceforge.net/files/dx70_mgw.tar.gz)
md5sums=('ad7ed5770c8ff597c2ceb89bd31c1e50')

build() {
  cd $srcdir/include

  for i in *.*; do
	tr -d '\r' < $i > $i.new
	mv -f $i.new $i
  done

  mkdir -p $pkgdir/usr/i486-mingw32/include
  cp -rf *.* $pkgdir/usr/i486-mingw32/include/
}

# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: rabyte <rabyte__gmail>
# Contributor: Alexander Jakopin <setrodox@users.sourceforge.net>
# Contributor: Matěj Týč <bubla@users.sourceforge.net>

pkgname=mingw32-dx8-headers
pkgver=8.0
pkgrel=1
pkgdesc="Minimal DirectX 8 SDK for MinGW (headers only)"
arch=('any')
url="http://msdn.microsoft.com/directx/"
license=('unknown')
depends=('mingw32-gcc')
provides=('mingw32-dx7-headers')
conflicts=('mingw32-dx7-headers')
source=(http://alleg.sourceforge.net/files/dx80_mgw.tar.gz)
md5sums=('6bd6a20fa39f3a8fe44439b92b891522')

build() {
  cd $srcdir/include

  for i in *.*; do
	tr -d '\r' < $i > $i.new
	mv -f $i.new $i
  done

  mkdir -p $pkgdir/usr/i486-mingw32/include
  cp -rf *.* $pkgdir/usr/i486-mingw32/include/

  # delete those that are already provided by mingw32-w32api
  rm $pkgdir/usr/i486-mingw32/include/{dshow.h,dvdevcod.h,dvdmedia.h,dxerr8.h}
}

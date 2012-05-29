# Maintainer: Naelstrof <naelstrof@gmail.com>
pkgname=mingw32-utf8-cpp
pkgver=2.3.2
pkgrel=1
pkgdesc="A simple, portable and lightweight generic library for handling UTF-8 encoded strings."
arch=(any)
url="http://utfcpp.sourceforge.net/"
license=('GPL')
source=("http://garr.dl.sourceforge.net/project/utfcpp/utf8cpp_2x/Release%202.3.2/utf8_v2_3_2.zip")
md5sums=('e01080a941dfda1136b992d996245e77')

package() {
	mkdir -p $pkgdir/usr/i486-mingw32/include
	cp -R $srcdir/source/* $pkgdir/usr/i486-mingw32/include
}

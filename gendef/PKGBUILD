# Maintainer: Daniel Kirchner <daniel at ekpyron dot org>

pkgname=gendef
pkgver=1.0.1346
pkgrel=1
pkgdesc="Tool to generate .def files from dlls."
arch=('i686' 'x86_64')
url="http://www.mingw.org/"
license=('custom')
source=("https://downloads.sourceforge.net/project/mingw/MinGW/Extension/gendef/gendef-1.0.1346/gendef-1.0.1346-1-mingw32-src.tar.lzma")
md5sums=('44761bf08b1fa2c2ced3096b8d2ac7cb')

build() {
  cd "$srcdir"
  tar -xf $pkgname-$pkgver.tar.lzma
  cd $pkgname-$pkgver
  sed -i -e 's/unable to allocate %Iu bytes/unable to allocate %Ilu bytes/' src/gendef.c
  sed -i -e 's/fread (gDta, 1, gDta_size, fp);/gDta_size = fread (gDta, 1, gDta_size, fp);/' src/gendef.c
  ./configure --prefix=/usr
  make
  make DESTDIR=$pkgdir install
}

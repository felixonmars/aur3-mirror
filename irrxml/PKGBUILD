# Maintainer: Hilton Medeiros <medeiros.hilton AT gmail DOT com>

pkgname=irrxml
_pkgname=libIrrXML
pkgver=1.2
pkgrel=1
pkgdesc="A simple and fast open source xml parser for C++"
arch=('i686' 'x86_64')
url="http://www.ambiera.com/irrxml/"
license=('ZLIB')
depends=('gcc-libs')
source=("http://downloads.sourceforge.net/irrlicht/$pkgname-$pkgver.zip"
        COPYING)
md5sums=('41eabd2d337917c912ee6d28613efebf'
         '0a64b8bfec6548a32671b960f2e4dd33')

build() {
  cd $srcdir/$pkgname-$pkgver

  g++ -fPIC $CXXFLAGS -shared -Wl,-soname,$_pkgname.so.1 -o $_pkgname.so.1.2 \
      src/irrXML.cpp || return 1
  ln -s $_pkgname.so.1.2 $_pkgname.so.1
  ln -s $_pkgname.so.1 $_pkgname.so

  install -d $pkgdir/usr/lib \
             $pkgdir/usr/include/irrXML \
             $pkgdir/usr/share/licenses/$pkgname

  mv lib* $pkgdir/usr/lib
  install -Dm644 src/irrXML.h $pkgdir/usr/include/irrXML
  install -Dm644 $srcdir/COPYING $pkgdir/usr/share/licenses/$pkgname
}

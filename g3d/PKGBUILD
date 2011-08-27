# Contributor: Kaspar Bumke <kaspar.bumke@gmail.com>
pkgname=g3d
_srcname=$(echo $pkgname | tr 'a-z' 'A-Z' )
pkgver=8.00_b04
_src=(${_srcname}-${pkgver/_/-}-src.zip)
pkgrel=1
pkgdesc="A commercial-grade C++ 3D engine"
arch=('i686' 'x86_64')
url="http://g3d.sourceforge.net"
license=('BSD')
depends=(sdl freeglut zlib libzip libpng libjpeg gcc)
makedepends=(unzip sdl freeglut libzip zlib libpng libjpeg gcc)
optdepends=()
provides=(viewer gfxmeter newclass)
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://downloads.sourceforge.net/g3d/$_src $pkgname-$pkgver.patch )
noextract=($_src)
md5sums=('bfdbfc0ea116eb203762750a41c0ed5a'
         'bca68c198e1f4972eac8c9224e00ef35')
build() {
  cd "$srcdir"
  unzip -d "$pkgname-$pkgver" $_srcname-${pkgver/_/-}-src.zip
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -R -i ../$pkgname-$pkgver.patch
  cd $_srcname/
  ./buildg3d --install "$pkgdir/" update
  cd $pkgdir
  mkdir -p opt/g3d
  mv G3D include lib bin usr opt/g3d/
}


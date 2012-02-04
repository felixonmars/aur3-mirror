# Contributor:	Rene Reigel	<gmx.net: stormtrooperofdeath>
# Maintainer:	Jesse Jaara	<gmail.com: jese.jaara	     >

pkgname=mtmintkit
pkgver=0.9.0
pkgrel=2
pkgdesc="GUI tookit for SLD"
arch=('i686' 'x86_64')
url="http://mtmintkit.sourceforge.net/"
license=('GPL')
depends=('freetype2' 'sdl')
source=(http://downloads.sourceforge.net/mtmintkit/${pkgname}-${pkgver}.tar.bz2)
md5sums=('c999e9d87abd00e6c043a1e3addbfab0')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  CFLAGS="$CFLAGS -fPIC"
  ./configure --prefix="${pkgdir}/usr" \
	      --bindir="${pkgdir}/usr/share/mtmintkit/examples" \
	      cflags
  cd src
  make

  cd ../examples
  make all docs
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "${pkgdir}/usr/share/mtmintkit/examples"
  sed 's|ldconfig||g' -i src/libtool
  make binstdirs="src examples" install
  cp -r doc/handbook "${pkgdir}/usr/share/mtmintkit/"
}

# vim:set ts=2 sw=2 et:

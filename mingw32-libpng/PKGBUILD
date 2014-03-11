# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>

pkgname=mingw32-libpng
pkgver=1.6.9
pkgrel=1
arch=('any')
pkgdesc="A collection of routines used to create PNG format graphics (mingw32)"
depends=('mingw32-runtime' 'mingw32-zlib')
makedepends=('mingw32-gcc')
license=('custom')
url="http://www.libpng.org/pub/png/libpng.html"
options=(!strip !buildflags staticlibs)
source=("http://downloads.sourceforge.net/project/libpng/libpng16/$pkgver/libpng-$pkgver.tar.gz"
        "http://downloads.sourceforge.net/project/libpng-apng/libpng16/$pkgver/libpng-$pkgver-apng.patch.gz")
md5sums=('edd26ef2bf561786b2185f2b8afda78b'
         'd784762a28f6a6c697a162873807f479')

build() {
  cd "$srcdir/libpng-$pkgver"

  # Add animated PNG (apng) support
  # see http://sourceforge.net/projects/libpng-apng/
  patch -p1 -i "${srcdir}/libpng-$pkgver-apng.patch" || return 1

  ./configure --host=i486-mingw32 --prefix=/usr/i486-mingw32

  make
}

package() {
  cd "$srcdir/libpng-$pkgver"

  make install DESTDIR=$pkgdir

  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

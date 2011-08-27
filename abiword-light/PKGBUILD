pkgname=abiword-light
pkgver=2.8.6
pkgrel=2
pkgdesc="A fully-featured word processor without some gnome dependencies"
arch=(i686 x86_64)
license=('GPL')
url="http://www.abisource.com"
depends=('fribidi>=0.10.9' 'wv>=1.2.4' 'libglade>=2.0')
makedepends=('pkgconfig')
conflicts=('abiword')
provides=('abiword')
options=('!makeflags' '!libtool')
source=(http://www.abisource.com/downloads/abiword/${pkgver}/source/abiword-${pkgver}.tar.gz)

build() {
  cd ${srcdir}/abiword-${pkgver}/
  ./configure --prefix=/usr \
  --with-libxml2 \
  --disable-gucharmap \
  --disable-spellcheck \
  --disable-printing
  make || return 1
  make DESTDIR=${startdir}/pkg install
  rm -rf ${pkgdir}/usr/share
}
md5sums=('f883b0a7f26229a9c66fd6a1a94381aa')

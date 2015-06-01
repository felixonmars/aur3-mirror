# Maintainer: Miikka Ahonen <ma65547 at gmail dot com>

pkgname=smjpeg
pkgver=0.2.2
pkgrel=1
pkgdesc="SDL Motion JPEG Library"
arch=('i686' 'x86_64')
url="http://icculus.org/smjpeg/"
license=('GPL2')
depends=('sdl')
makedepends=('svn')
options=('!libtool')
source=("${pkgname}-${pkgver}::svn://svn.icculus.org/smjpeg/trunk")
md5sums=('SKIP')

prepare() {
  cd "${pkgname}-${pkgver}"

  aclocal
  autoconf
  automake --foreign --add-missing --force --copy
}

build() {
  cd "${pkgname}-${pkgver}"

  ./configure --prefix=/usr --disable-static
  make
}

check() {
  cd "${pkgname}-${pkgver}"

  make check
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

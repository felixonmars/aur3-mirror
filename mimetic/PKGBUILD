# Contributor: Dmitry Popov <ixaphire@gmail.com>

pkgname=mimetic
pkgver=0.9.8
pkgrel=1
pkgdesc="Mimetic, C++ MIME Library"
arch=('i686' 'x86_64')
url="http://www.codesink.org/mimetic_mime_library.html"
depends=()
source=(http://www.codesink.org/download/${pkgname}-${pkgver}.tar.gz)
license=('MIT')
md5sums=('7a00a73fac59fd86e5c145497786cfbe')
 
build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=${pkgdir}/usr/
  make || return 1
  make install || return 1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || return 1
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING" || return 1
}

# Maintainer: ponsfoot <cabezon dot hashimoto at gmail dot com>

pkgname=ibus-kkc
pkgver=1.5.14
pkgrel=1
pkgdesc="libkkc (Japanese Kana Kanji input method) engine for ibus"
arch=('i686' 'x86_64')
url="https://bitbucket.org/libkkc"
license=('GPL')
options=(!libtool)
depends=('ibus' 'libkkc')
makedepends=('vala0.18')
changelog=ChangeLog
source=(https://bitbucket.org/libkkc/${pkgname}/downloads/${pkgname}-${pkgver}.tar.gz)
sha1sums=('9396521d85501757dd42c64f92e52a2e5f514872')

build() {
  cd "${pkgname}-${pkgver}"
  VALAC=/usr/bin/valac-0.18 \
  ./configure --prefix=/usr --libexecdir=/usr/lib/ibus-kkc --disable-static
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}

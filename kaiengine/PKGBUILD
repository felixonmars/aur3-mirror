# Maintainer: pckt <pckt AT rm-rv DOT com>
pkgname=kaiengine
pkgver=7.4.18
pkgrel=1
pkgdesc="Multiplatform tunneling software for gaming"
_pkgname="kaiEngine"
arch=('i686' 'x86_64')
url="https://www.teamxlink.co.uk"
license=('Unknown')
depends=('wxgtk' 'boost' 'libcanberra' 'gtk')
makedepends=()
options=(!strip)
install=('readme.install')
source=(http://cdn.teamxlink.co.uk/binary/$_pkgname-$pkgver-linux-x86.tgz)
build() {
  unset LDFLAGS
  cd "$srcdir/$_pkgname-$pkgver"
}

package() {
   install -D -m755 ${srcdir}/${_pkgname}-${pkgver}/${pkgname} \
    ${pkgdir}/usr/bin/${_pkgname}
}
sha256sums=('63925e2dee36a6267737f01aa7a50f955fe5889c762d52dc250a2af0cdadadeb')

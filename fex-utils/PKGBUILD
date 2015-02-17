# Author: Ullrich Horlacher <framstag@rus.uni-stuttgart.de>
# Maintainer: Alexander Schmidt <alex@treefish.org>

pkgname=fex-utils
pkgver=20150120
pkgrel=7
pkgdesc="Utilities for F*EX, a web service to send very large files."
arch=('any')
url="http://fex.rus.uni-stuttgart.de"
license=('custom:Anti-military Perl Artistic License')
depends=(
  'perl'
  'perl-io-socket-ssl'
)
source=("http://fex.rus.uni-stuttgart.de/download/archive/fex-${pkgver}.tar")
sha256sums=('5dfbb06c7e5361fea90a8901d3ebda5d1ef2f29e167e28248766213e22e364fc')

package() {
  install -Dm755 -t ${pkgdir}/usr/bin \
    ${srcdir}/fex-${pkgver}/bin/afex \
    ${srcdir}/fex-${pkgver}/bin/asex \
    ${srcdir}/fex-${pkgver}/bin/fexsend \
    ${srcdir}/fex-${pkgver}/bin/fexget \
    ${srcdir}/fex-${pkgver}/bin/sexsend \
    ${srcdir}/fex-${pkgver}/bin/sexget \
    ${srcdir}/fex-${pkgver}/bin/sexxx \
    ${srcdir}/fex-${pkgver}/bin/xx \
    ${srcdir}/fex-${pkgver}/bin/zz \
    ${srcdir}/fex-${pkgver}/bin/ezz

  install -Dm755 -t ${pkgdir}/usr/share/${pkgname}/bin \
    ${srcdir}/fex-${pkgver}/bin/fbm

  install -Dm644 ${srcdir}/fex-${pkgver}/doc/Licence \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

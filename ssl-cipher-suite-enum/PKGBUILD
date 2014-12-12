# Maintainer: Borja Ruiz <borja [at] libcrack [dot] so>
pkgname=ssl-cipher-suite-enum
pkgver=1.0.0
pkgrel=1
pkgdesc='Perl script to enumerate supported SSL cipher suites supported by network services (principally HTTPS)'
arch=('any')
url='https://labs.portcullis.co.uk/tools/ssl-cipher-suite-enum/'
license=('GPL2')
depends=('perl')
provides=('ssl-cipher-suite-enum')
source=("https://labs.portcullis.co.uk/download/tools/ssl-cipher-suite-enum-v${pkgver}.tar.gz")
sha256sums=('c4de0162b7ab2e7b3af44ed51b71623433ed792c1613a1b51a29e232dbd4c9ff')

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  install -d 644 "$pkgdir/usr/bin"
  install -c -m 755 "${pkgname}.pl" "$pkgdir/usr/bin"
}

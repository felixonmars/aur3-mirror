# Maintainer: lq <lq@le1.ca>
pkgname=hostap-utils
pkgver=0.4.7
pkgrel=2
pkgdesc="Utility programs for Host AP driver for Intersil Prism2/2.5/3"
url="http://hostap.epitest.fi/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('bash')
source=("http://hostap.epitest.fi/releases/${pkgname}-${pkgver}.tar.gz")
md5sums=('afe041581b8f01666e353bec20917c85 ')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D hostap_crypt_conf "$pkgdir/usr/local/bin/hostap_crypt_conf"
  install -D hostap_diag "$pkgdir/usr/local/bin/hostap_diag"
  install -D hostap_fw_load "$pkgdir/usr/local/bin/hostap_fw_load"
  install -D hostap_io_debug "$pkgdir/usr/local/bin/hostap_io_debug"
  install -D hostap_rid "$pkgdir/usr/local/bin/hostap_rid"
  install -D prism2_param "$pkgdir/usr/local/bin/prism2_param"
  install -D prism2_srec "$pkgdir/usr/local/bin/prism2_srec"
  install -D split_combined_hex "$pkgdir/usr/local/bin/split_combined_hex"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}


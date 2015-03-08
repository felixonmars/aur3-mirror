# Maintainer: Simonas Racinas <racinas at icloud.com>
pkgname=macbookpro-synaptics
pkgver=1
pkgrel=1
pkgdesc="Synaptics touchpad config file for MacBookPro Alluminum (Tested on MacBookPro-mid2012)"
arch=('any')
url='http://synaptics.com'
depends=('xf86-input-synaptics')
license=('GPL')
source=('55-synaptics.conf')
sha256sums=('496a45e97e75c5496c611aeba340daf885dc99e60ed28fcbecaf3ad85a003f4e')
package() {
  mkdir -p ${pkgdir}/etc/X11/xorg.conf.d
  cp "55-synaptics.conf" "${pkgdir}/etc/X11/xorg.conf.d/55-synaptics.conf"
}

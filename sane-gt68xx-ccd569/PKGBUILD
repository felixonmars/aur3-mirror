# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>

pkgname=sane-gt68xx-ccd569
pkgver=20110818
pkgrel=1
pkgdesc="A sane gt68xx firmware."
arch=('any')
url="http://geniusnet.com"
license=('custom')
makedepends=('unshield')
depends=('sane')
options=('!strip')
source=("http://download.geniusnet.com/2007/Scanner/V1200XE_V32.zip")
md5sums=('fc1b9156bfcddb0ecb259007e35f70cf')

package() {
  cd "$srcdir/ColorPage-Vivid 1200XE"
  unshield x data1.cab
  install -Dm644 DRV_USB_GT6816/CCD569.fw "$pkgdir/usr/share/sane/gt68xx/ccd569.fw"
}


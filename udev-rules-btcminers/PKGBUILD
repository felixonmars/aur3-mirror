# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
# Based off package: android-udev by marlock

pkgname=udev-rules-btcminers
pkgver=1
pkgrel=1
pkgdesc='Udev rules to connect ASIC bitcoin miners to your computer'
arch=(any)
url='https://github.com/ckolivas/cgminer/blob/master/01-cgminer.rules'
license=(GPLv3)
depends=('udev')
install='udev-rules-btcminers.install'
source=(https://raw.githubusercontent.com/ckolivas/cgminer/master/01-cgminer.rules)
md5sums=('SKIP')

pkgver() {
  printf $(date +%Y%m%d)
}

package() {
  install -Dm 644 01-cgminer.rules "$pkgdir"/usr/lib/udev/rules.d/01-cgminer.rules
}

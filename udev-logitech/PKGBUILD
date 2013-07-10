# Maintainer: Diego <cdprincipe@at@gmail@dot@com>

pkgname=udev-logitech
pkgver=0.9
pkgrel=1
pkgdesc="udev rules for Logitech Unifyng and Nano receivers"
url="http://pwr.github.com/Solaar/"
license=('GPL2')
groups=()
arch=('any')
depends=()
options=(!emptydirs)
install=udev-logitech.install
source=("https://github.com/pwr/Solaar/archive/${pkgver}.tar.gz" 
        'udev-logitech.install')
md5sums=('a10dddf1d7c5c22299fb724b35a2f04b'
         '285bc14d39cacfc9e6402834e4cc39d2')

package() {
  cd "$srcdir/Solaar-${pkgver}/"
  install -D -m0644 rules.d/42-logitech-unify-permissions.rules "$pkgdir/etc/udev/rules.d/42-logitech-unify-permissions.rules"
}

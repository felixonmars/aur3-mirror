# Contributor: tuxce <tuxce.net@gmail.com>
pkgname=e-pity
pkgver=2014
pkgrel=1
pkgdesc="Unofficial Polish taxing utility"
url="http://www.e-pity.pl/"
arch=('any')
license=('unknown')
depends=('bash' 'adobe-air')
source=(http://download.e-pity.pl/down/setup_e-pity${pkgver}.air)
noextract=(setup_e-pity${pkgver}.air)

prepare() {
  echo "#!/bin/sh" > $srcdir/e-pity
  echo "adobe-air /opt/airapps/e-pity/e-pity${pkgver}.air" >> e-pity
}

package()
{
  install -Dm 755 $srcdir/setup_e-pity${pkgver}.air $pkgdir/opt/airapps/e-pity/e-pity${pkgver}.air
  install -Dm 755 $srcdir/e-pity $pkgdir/usr/bin/e-pity
}

md5sums=('99d31e90c05398ab29e9efcca759e85e')

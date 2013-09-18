# Maintainer: Darren M < dar7272@gmail.com >
pkgname=oil
pkgver=1.0
pkgrel=5
pkgdesc="A tool to facilitate quick development with the FuelPHP framework"
arch=(any)
url="http://fuelphp.com"
license=('MIT')
depends=('bash' 'git' 'php')
optdepends=('apache: to run a FuelPHP app')
source=('http://get.fuelphp.com/installer.sh' 'LICENSE')
md5sums=('7df1517bfdb2a1b9b2fe76673515bee4' '1d04200753fa5f0019efab98b20a8f40')

package() {
	cd $srcdir
	install -D -m755 installer.sh ${pkgdir}/usr/bin/oil
	install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/oil/LICENSE
}

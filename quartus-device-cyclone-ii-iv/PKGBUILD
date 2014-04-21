# Maintainer: Stephen Zhang <zsrkmyn@gmail.com>
pkgname=quartus-device-cyclone-ii-iv
pkgver=13.1.0.162
pkgrel=1
pkgdesc="Cyclone III, Cyclone IV device support for Quartus II"
arch=('any')
url="http://www.altera.com.cn/products/software/quartus-ii/subscription-edition/qts-se-index.html"
license=('custom')
depends=('quartus-subscription')
source=("cyclone-${pkgver}.zip::http://download.altera.com/akdlm/software/acdsinst/13.1/162/ib_installers/cyclone-${pkgver}.qdz")
md5sums=('2252cd4e2cba75018f9b1325929f69ef')
options=(!strip)

package() {
	cd "$srcdir"
	install -d $pkgdir/opt/altera
	cp -r -P quartus/ $pkgdir/opt/altera
}

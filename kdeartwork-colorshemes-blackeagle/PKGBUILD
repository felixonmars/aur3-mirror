# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT be >
pkgname=kdeartwork-colorshemes-blackeagle
pkgver=1.0
pkgrel=1
pkgdesc="BlackEagles kde4 colors"
arch=('any')
url="http://www.herecura.be"
license=('GPL')
depends=()
source=(
	"BlackEagle_dark.colors"
	"BlackEagle_grey.colors"
	"BlackEagle_light.colors"
)
sha256sums=(
	'dbf400dcaab56c46e0782c58f4c068de139bfbaa7a75150924fac4a30e812917'
	'7d517899864e491c0631c3aa93290f94f3f747a44567ba7e5fa4ee4e3631d027'
	'db2a6b9006ab0dd6ede7c21a1af198eab4592cdd1dae29a04f9bf66899308fbd'
)

package() {
	# Create pkgdir folders
	install -d $pkgdir/usr/share/apps/color-schemes

	# Install
	install -Dm755 ${srcdir}/BlackEagle_dark.colors ${pkgdir}/usr/share/apps/color-schemes/
	install -Dm755 ${srcdir}/BlackEagle_grey.colors ${pkgdir}/usr/share/apps/color-schemes/
	install -Dm755 ${srcdir}/BlackEagle_light.colors ${pkgdir}/usr/share/apps/color-schemes/
}

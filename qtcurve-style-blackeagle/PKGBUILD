# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT be >
pkgname=qtcurve-style-blackeagle
pkgver=1.0
pkgrel=1
pkgdesc="BlackEagles QtCurve style"
arch=('any')
url="http://www.herecura.be"
license=('GPL')
depends=()
source=("BlackEagle.qtcurve")
sha256sums=('069bd1921a9f0cc57cca8d8481795934ee3e809af10d8ecd61abc248e77348c9')

package() {
	# Create pkgdir folders
	install -d $pkgdir/usr/share/apps/QtCurve

	# Install
	install -Dm755 ${srcdir}/BlackEagle.qtcurve ${pkgdir}/usr/share/apps/QtCurve/
}

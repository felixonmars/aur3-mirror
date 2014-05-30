# Packaged by jump (jump@fastmail.fm)

pkgname=networkmanager-dispatch-resolv
pkgver=1.0
pkgrel=3
pkgdesc="Make NetworkManager add the contents of resolv.conf.head and resolv.conf.tail around the auto-generated resolv.conf"
arch=(any)
license=('GPL')
url="http://gnome.org/projects/NetworkManager"
depends=('networkmanager')
source=(99-resolv)
sha256sums=('ffaf22514cdeda49b1354cdee07abc1b2d8ff536a72ffbebeaeb1dab8d1c4fd6')

package() {
	install -Dm700 $srcdir/99-resolv $pkgdir/etc/NetworkManager/dispatcher.d/99-resolv
}

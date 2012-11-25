# Packaged by Patrick Mullaney (pajmullaney@gmail.com)

pkgname=networkmanager-dispatch-resolv
pkgver=1.0
pkgrel=1
pkgdesc="Make NetworkManager add the contents of resolv.conf.head and resolv.conf.tail around the auto-generated resolv.conf"
arch=(any)
license=('GPL')
url="http://gnome.org/projects/NetworkManager"
depends=('networkmanager')
source=(99-resolv)
sha256sums=('8933ba7508debd0bc0958c95f1960dfcad7ff8c5356555445224d8ac66dc270f')

package() {
	install -Dm700 $srcdir/99-resolv $pkgdir/etc/NetworkManager/dispatcher.d/99-resolv
}

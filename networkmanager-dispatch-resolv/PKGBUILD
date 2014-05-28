# Packaged by jump (jump@fastmail.fm)

pkgname=networkmanager-dispatch-resolv
pkgver=1.0
pkgrel=2
pkgdesc="Make NetworkManager add the contents of resolv.conf.head and resolv.conf.tail around the auto-generated resolv.conf"
arch=(any)
license=('GPL')
url="http://gnome.org/projects/NetworkManager"
depends=('networkmanager')
source=(99-resolv)
sha256sums=('b02d788c72ca18a2650bf026a5616521ab2e2250f043fa7e9d6d5e4a724ac242')

package() {
	install -Dm700 $srcdir/99-resolv $pkgdir/etc/NetworkManager/dispatcher.d/99-resolv
}

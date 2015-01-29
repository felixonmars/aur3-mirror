# Maintainer: Anna Schumaker <anna@ocarinaproject.net>
pkgname=gossip-stone
pkgver=1.1
pkgrel=1
pkgdesc="A python based vpnc wrapper."
url="http://www.ocarinaproject.net/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('gksu' 'gobject-introspection' 'gtkmm3' 'libnotify' 'python' 'vpnc')
makedepends=('make')
conflicts=()
replaces=()
backup=()
source=("http://ocarinaproject.net/wp-content/gossip-stone/${pkgname}-${pkgver}.tar.gz")
sha1sums=('4da53bcd08839f5ce3eb165926942217e407c08b')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p ${pkgdir}/usr/share/applications/
	DEST=${pkgdir}/usr make install
}

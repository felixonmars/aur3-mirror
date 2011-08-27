# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=kvmd
pkgver=0.3
pkgrel=2
pkgdesc="Simple daemon to control KVM virtual machines."
arch=('i686' 'x86_64')
url="http://ghost1227.com"
license=('GPL')
depends=('qemu-kvm' 'screen')
source=(http://ghost1227.com/files/software/kvmd-${pkgver}.tar.gz)
md5sums=('d5a3a528804a1d2fa0945c9d99034c72')

build() {
	/bin/true
}

package() {
	cd ${srcdir}/kvmd-${pkgver}
	DESTDIR=${pkgdir} ./install
}

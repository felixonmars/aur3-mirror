# Contributor: Maarten de Boer <ventieldopje@gmail.com>
pkgname=xf86-input-evdev-multitouch
pkgver=2.3.1
pkgrel=3
pkgdesc="X.org evdev input driver (ENAC's multitouch version)"
arch=('i686' 'x86_64')
url="http://lii-enac.fr/en/projects/shareit/xorg.html"
license="GPL"
conflicts=('xf86-input-evdev')
provides=('xf86-input-evdev')
depends=('glibc')
makedepends=('xorg-util-macros')
source=(http://lii-enac.fr/en/projects/shareit/xf86-input-evdev.tar.bz2)
md5sums=(e8e1cfb4ac9f749b6dc4f5f9d61262c4)

build() {
	cd ${srcdir}/xf86-input-evdev
	./autogen.sh --prefix=/usr
	make || return 1
	make DESTDIR=${pkgdir} install
}

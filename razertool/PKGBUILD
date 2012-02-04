# Contributer: Sebastian Sareyko <public@nooms.de>
# Contributer: N30N <archlinux@alunamation.com>

pkgname=razertool
pkgver=0.0.7
pkgrel=3
pkgdesc="Unofficial tool for controlling the Razer Copperhead(TM) mouse"
url="http://razertool.sourceforge.net"
license=("GPL")
depends=("gtk2")
makedepends=("libusb")
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz)
md5sums=("dad8236b2fface39f054a7ca6d1a448c")
arch=("i686" "x86_64")

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	./configure --prefix=/usr
	msg "Starting build process."
	make || return 1
	make DESTDIR=${pkgdir} install

	# install -D -m644 ${srcdir}/razertool.desktop ${pkgdir}/usr/share/applications/razertool.desktop
}

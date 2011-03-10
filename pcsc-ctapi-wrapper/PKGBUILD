# Maintainer: Thilo Berndt <mail AT schlehmil DOT org>

pkgname=pcsc-ctapi-wrapper
pkgver=0.3
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc="A wrapper library for using smartcard readers that support PCSC only (e.g. SCR24x) with any application that supports CTAPI."
url="http://sourceforge.net/projects/pcsc-ctapi"
depends=('pcsclite')
source=("http://downloads.sourceforge.net/project/pcsc-ctapi/pcsc-ctapi/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('d95cf20bba354fb04e054f1f6a1e47d8')

_pkgname="${pkgname}-${pkgver}"

build() {
	cd $srcdir/${_pkgname}
	make
}

package() {
	# copy library
	cd $srcdir/${_pkgname}
	install -D -m755 libpcsc-ctapi-wrapper.so.${pkgver} ${pkgdir}/usr/lib/libpcsc-ctapi-wrapper.so.${pkgver}
	# create symlinks
	cd ${pkgdir}/usr/lib
	ln -s libpcsc-ctapi-wrapper.so.${pkgver} libpcsc-ctapi-wrapper.so.0
	ln -s libpcsc-ctapi-wrapper.so.${pkgver} libpcsc-ctapi-wrapper.so
}

# Mantainer: WinterXMQ <WinterXMQ at gmail dot com>
# Contributor: WinterXMQ <WinterXMQ at gmail dot com>

pkgname=bochs-with-debugger
_pkgrealname=bochs
pkgver=2.6.2
pkgrel=3
pkgdesc="A portable x86 PC emulation software package with builtin debugger"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://bochs.sourceforge.net/"
source=(http://downloads.sourceforge.net/project/${_pkgrealname}/${_pkgrealname}/${pkgver}/${_pkgrealname}-${pkgver}.tar.gz)
sha512sums=('b35cf940520d2489657a1724f399553f7a52428fd4a84b1c38452723cc47bfbc242853489701c1aa577903045ce3dae4ca475c8934953b66bcc247d50835c7d3')
depends=('gcc-libs' 'libxrandr' 'gtk2')
conflicts=('bochs')

build() {
	cd "${srcdir}/${_pkgrealname}-${pkgver}"
	## build Debug Bochs
	./configure \
		--enable-smp \
		--with-x11 \
		--with-sdl \
		--enable-smp \
		--enable-3dnow \
		--enable-x86-64 \
		--enable-avx \
		--enable-debugger \
		--enable-x86-debugger \
		--enable-long-phy-address \
		--enable-plugins \
		--enable-all-optimizations \
		--enable-disasm \
		--enable-pcidev \
		--enable-usb \
		--disable-docbook \
		--enable-cpp \
		--prefix=/usr
	## add libaray pthread(is not Linux default libaray), because of missing DSO
	sed -i 's/^LIBS = /LIBS = -lpthread/g' Makefile
	make
}

package() {
	cd "${srcdir}/${_pkgrealname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -D -m 644 .bochsrc "${pkgdir}/etc/bochsrc-sample.txt"
}

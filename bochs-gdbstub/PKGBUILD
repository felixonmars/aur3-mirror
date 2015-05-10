
# PKGBUILD modified by zxalexis-dot-gmail.com (Alexey Khromov)
# from bochs-with-debugger AUR PKG

pkgname=bochs-gdbstub
_pkgrealname=bochs
pkgver=2.6.8
pkgrel=1
pkgdesc="A portable x86 PC emulation software package with gdbstub"
arch=(i686 x86_64)
license=('LGPL')
url="http://bochs.sourceforge.net/"
source=(http://downloads.sourceforge.net/project/${_pkgrealname}/${_pkgrealname}/${pkgver}/${_pkgrealname}-${pkgver}.tar.gz)
md5sums=('8a243e2b5f7562f32d2b26f3cebbba08')
sha256sums=('79700ef0914a0973f62d9908ff700ef7def62d4a28ed5de418ef61f3576585ce')
sha512sums=('5e7438a6a09417cbc0b311810a485374bb9b10be452edd9daff0afacd487ada66f37b8189d4868d3420dae82ef6c38fe279d541d24f8a41bf1ca59359572e7bd')
depends=('libxpm' 'gtk2')
conflicts=('bochs')

build() {
	cd "${srcdir}/${_pkgrealname}-${pkgver}"
	LIBS=-lpthread ./configure	\
	  --prefix=/usr			\
	  --enable-gdb-stub
	make
}

package() {
    cd "${srcdir}/${_pkgrealname}-${pkgver}"

	make prefix=${pkgdir}/usr install
}

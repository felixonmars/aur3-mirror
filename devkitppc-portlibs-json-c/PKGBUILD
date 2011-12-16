# Maintainer: Karim DRIDI <karim.dridi@arykow.com>
pkgname=devkitppc-portlibs-json-c
pkgver=0.9
pkgrel=1
pkgdesc='A JSON implementation in C'
arch=('i686' 'x86_64')
url='http://oss.metaparadigm.com/json-c/'
license=('custom')
options=(!strip libtool)
depends=('devkitppc')
source=("http://oss.metaparadigm.com/json-c/json-c-${pkgver}.tar.gz")
md5sums=('3a13d264528dcbaf3931b0cede24abae')

build() {
	source /etc/profile.d/devkitppc.sh
	cd "${srcdir}/json-c-${pkgver}"
	export CFLAGS="-g -O2 -Wall -L${DEVKITPRO}/portlibs/ppc/lib -I${DEVKITPRO}/portlibs/ppc/include -Wno-char-subscripts"
	export DEVKITPRO="${pkgdir}/opt/devkitpro"
	./configure --prefix="${DEVKITPRO}/portlibs/ppc" --host=powerpc-eabi --disable-shared --enable-static
	make || return 1
	make install || return 1
}

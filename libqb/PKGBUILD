# Maintainer: Charles Goyard <cg@fsck.fr>
# Contributor: Eric Renfro <erenfro@gmail.com>

pkgname=libqb
pkgver=0.17.1
pkgrel=2
pkgdesc="library with the primary purpose of providing high performance client server reusable features."
arch=('i686' 'x86_64')
url="http://clusterlabs.github.io/libqb/"
license=('GPL')
makedepends=('')
depends=('glibc')
source=("https://fedorahosted.org/releases/q/u/quarterback/libqb-${pkgver}.tar.xz")

sha256sums=('7a2115f83bfe20eaa5f2e4ed235e8f2994235d3b87e3e5ca41ba47b320f12e29')
options=('!libtool' 'docs' 'strip')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./autogen.sh
	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install || return 1
}

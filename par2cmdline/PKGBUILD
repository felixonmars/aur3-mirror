# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >
pkgname=par2cmdline
pkgver=0.5.3
pkgrel=2
pkgdesc="A file verification and repair tool"
url="https://github.com/BlackIkeEagle/par2cmdline"
license="GPL"
depends=('gcc-libs')
arch=('i686' 'x86_64')
source=("https://github.com/downloads/BlackIkeEagle/par2cmdline/${pkgname}-${pkgver}.tar.xz")
sha256sums=('4218e8188803f0e8c877c28536c58bf671dc62acd8c93dab4a3c8cd3d4fb61e3')

build() {
	cd ${pkgname}-${pkgver}
	# automake
	aclocal
	automake --add-missing
	autoconf
	# configure
	./configure --prefix=/usr
	# make
	make
}

check() {
	cd ${pkgname}-${pkgver}
	make check
}

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR=$startdir/pkg install
}

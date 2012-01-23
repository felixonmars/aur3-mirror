# Dev: NeOnsKull
# Maintainer: hasufell

pkgname=obmenugen-bin
mypkgname=obmenugen
pkgver=0.5
pkgrel=3
_serie=0.5
_pkgrev=72
mypkg=${mypkgname}-${pkgver}-r${_pkgrev}
pkgdesc="Menu generator for Openbox3, based on .desktop files"
url="https://launchpad.net/obmenugen"
arch=('i686' 'x86_64')
license=('GPL2')
depends=(openbox)
conflicts=(obmenugen)
options=('!strip' 'docs')
source=(http://launchpad.net/${mypkgname}/${_serie}/${pkgver}/+download/${mypkg}.tar.bz2)
md5sums=(c28dd7c12044062e50792f8edd0365c2)

[ "$CARCH" = "x86_64" ] && depends=(${depends[@]} lib32-glibc)

package() {
	cd "${srcdir}/${mypkg}"

	msg "removing htmldoc installation rule..."
	sed  -i -e '/html$/d' Makefile || return 1

	msg "installing binary and translations..."
	make PREFIX="${pkgdir}"/usr BUILDPREFIX="${srcdir}/${mypkg}" install

	msg "installing docs..."
	install -Dm644 README.txt \
		"${pkgdir}/usr/share/doc/${mypkgname}/README" || return 1
	install -Dm644 "html/${mypkgname}.html" \
		"${pkgdir}/usr/share/doc/${mypkgname}/${mypkgname}.html" || return 1
}
# Maintainer: Richard Pougnet <Richard \u0040 Pougnet \u002E ca>
pkgname=jaxodraw
pkgver=2.1
pkgrel=0
pkgdesc="A complete program for drawing Feynman diagrams."
arch=(any)
url="http://jaxodraw.sourceforge.net"
license=('GPL')
depends=(java-runtime)
optdepends=('texlive-core: LaTeX output', 'axodraw4jsty: Stylesheet needed for LaTeX output')
source=(http://jaxodraw.sourceforge.net/download/pkgs/${pkgname}-${pkgver}-${pkgrel}-bin.tar.gz)
md5sums=('1bf230aa874cd5477be6c6f971f2ff0d')

build() {
	cd "${srcdir}"
	tar xf "$pkgname-$pkgver-$pkgrel-bin.tar.gz"
	mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/share/java"
	mv "$pkgname-$pkgver-$pkgrel" "${pkgdir}/usr/share/java/$pkgname"
	echo -e '#!/bin/sh \n\n java -jar /usr/share/java/jaxodraw/jaxodraw-2.1-0.jar "$@" \n exit "$?"' > "${pkgdir}/usr/bin/$pkgname"
	chmod 755 "${pkgdir}/usr/bin/$pkgname"	
}

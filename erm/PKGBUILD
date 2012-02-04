# Contributor: Jakub Fiser AKA mr.MikyMaus <mr@MikyMaus.org>
# Maintainer: mmm
pkgname=erm
pkgver=4.23
pkgrel=4
pkgdesc="An ER Modeller written in Java. used for teaching at CVUT FEL, Prague"
arch=('i686' 'x86_64')
url="http://service.felk.cvut.cz/courses/Y36DBS"
license=('unknown')
depends=('java-runtime')
makedepends=('unzip')
source=("http://service.felk.cvut.cz/courses/Y36DBS/additions/$pkgname-$pkgver.zip")
noextract=("$pkgname-$pkgver.zip")
md5sums=('9ab7140acfed08a5648067af248823c9')

build() {
cd "${srcdir}"
unzip "$pkgname-$pkgver.zip"
mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/bin"
mv "$pkgname-$pkgver" "${pkgdir}/opt/$pkgname"
echo -e '#!/bin/sh \n\n java -jar /opt/erm/erm.jar "$@" \n exit "$?"' > "${pkgdir}/usr/bin/erm"
chmod 755 "${pkgdir}/usr/bin/erm"
}

# vim:set ts=2 sw=2 et:

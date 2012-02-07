# Maintainer: nobody (adopt me !)
pkgname=ocamlweb
pkgver=1.37
pkgrel=1
pkgdesc="A tool for literate programming in ocaml"
url="http://www.lri.fr/~filliatr/ocamlweb/"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=()
optdepends=('texlive-core')
makedepends=('ocaml' 'texlive-bin')
conflicts=()
replaces=()
backup=()
source=("http://www.lri.fr/~filliatr/ftp/ocamlweb/${pkgname}-${pkgver}.tar.gz")
md5sums=('ced969e589bf2e72f467dfc37b5a4f29')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix="${pkgdir}/usr/local"
	make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
	make install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim:set ts=2 sw=2 et:

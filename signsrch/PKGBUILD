# Maintainer: smx
pkgname=signsrch
pkgver=0.2.2
pkgrel=2
pkgdesc="Signsrch is a tool for searching signatures inside files."
url="http://aluigi.altervista.org/"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=()
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("http://aluigi.altervista.org/mytoolz/signsrch.zip"
	"patch-sigfile.patch")
md5sums=('e8419f6eda70a312cc7c95317616f6f8'
	'516bf97e9dbde29d26e772c3e932da59')

prepare(){
  cd "${srcdir}"
  patch -p0 -i ../patch-sigfile.patch
}

build() {
  cd "${srcdir}/src"
  make
}

package() {
  cd "${srcdir}/src"
install -m 755 -d ${pkgdir}/usr/bin
install -m 755 -d ${pkgdir}/usr/share
install -m 755 -d ${pkgdir}/usr/share/signsrch
install -m 755 signsrch ${pkgdir}/usr/bin/signsrch
install -m 644 ${srcdir}/signsrch.sig ${pkgdir}/usr/share/signsrch/signsrch.sig
}

# vim:set ts=2 sw=2 et:

# Maintainer: orbisvicis <''.join(chr(ord(c)-1) for c in "pscjtwjdjtAhnbjm/dpn")>
# Maintainer: epsy <epsy nospace 46 at free dot fr>

pkgname=context-free
pkgver=3.0
pkgrel=1
pkgdesc="A digital art program that generates images from context free design grammar (CFDG) files"
arch=("i686" "x86_64")
url="http://www.contextfreeart.org/"
license=("GPL2")
depends=("libpng" "ffmpeg")
makedepends=("flex" "bison")
provides=("cfdg=${pkgver}")
conflicts=("cfdg")
options=()
source=("http://www.contextfreeart.org/download/ContextFreeSource${pkgver}.tgz")
sha256sums=("b67626eb88e4a9a7439bf6e82c828e4f0bd59d38cc1a244a22856dd61dced009")

build(){
  cd "${srcdir}/ContextFreeSource${pkgver}"
  sed -i 's/^LIBS\s\+=.*/\0 m/' Makefile
  make
}

package() {
  cd "${srcdir}/ContextFreeSource${pkgver}"
  install -m755 -d "${pkgdir}/usr/bin"
  install -m755 -t "${pkgdir}/usr/bin" cfdg

  install -m755 -d "${pkgdir}/usr/share/${pkgname}/examples"
  install -m644 -t "${pkgdir}/usr/share/${pkgname}/examples" input/*.cfdg
}

# vim:set ts=2 sw=2 et:

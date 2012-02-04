# Maintainer: orbisvicis <''.join(chr(ord(c)-1) for c in "pscjtwjdjtAhnbjm/dpn")>
pkgname=nnls-chroma
pkgver=0.2.1
pkgrel=1
pkgdesc="Vamp plugin library for harmony and chord extraction using Non-Negative Least Squares"
arch=("i686" "x86_x64")
url="http://isophonics.net/nnls-chroma/"
license=("GPL")
depends=("vamp-plugin-sdk")
install="${pkgname}.install"
source=("http://isophonics.net/sites/isophonics.net/files/${pkgname}-${pkgver}.tgz"
        "${pkgname}.install")
sha256sums=("7a87638f34b995df4553d70eb4b131066ad2c718a84275513ffd0479e53fe370"
            "af65c235bd31317853d40d88f37a31830e665d3f634aecc060ee24754502cf17")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -i 's/\S*vamp-sdk.a\S*/-lvamp-sdk/p' Makefile.linux
  make -f Makefile.linux
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -m755 -d "${pkgdir}/usr/lib/vamp"
  install -m755 -t "${pkgdir}/usr/lib/vamp" "${pkgname}.so"
  install -m644 -t "${pkgdir}/usr/lib/vamp" "${pkgname}."{cat,n3} chord.dict

  install -m755 -d "${pkgdir}/usr/share/${pkgname}"
  install -m644 -t "${pkgdir}/usr/share/${pkgname}" README
}

# vim:set ts=2 sw=2 et:

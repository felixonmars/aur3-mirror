# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=acm-5.0-ico
pkgver=20100109
pkgrel=1
pkgdesc="A fork of the ACM flight simulator"
arch=('i686' 'x86_64')
url="http://www.icosaedro.it/acm/download.html"
license=('GPL')
depends=('libxext' 'tk')
source=("http://www.icosaedro.it/acm/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.patch"
        "${pkgname}.png"
        "${pkgname}.desktop")
md5sums=('edb78272b8121bcc66a4c97fa86caf9f'
         '42ddb7584e519d36ea91216570523b6d'
         '4050d74a744af6e0ac472b6c3c225a3a'
         'b7c63ceebae459820960644be7a11096')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Fix data and binary paths
  patch -Np1 -i ../${pkgname}.patch

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install binary and launcher
  install -Dm755 src/acm "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 acm.tk "${pkgdir}/usr/bin/${pkgname}.tk"

  # Install data files
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  install -m644 objects/*.{acmscene,au,dxf,obv,txt} \
                objects/inventory \
                "${pkgdir}/usr/share/${pkgname}"

  # Install a desktop entry
  install -Dm644 ../${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install documentation
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r doc/* CHANGES README "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 src/acm.man "${pkgdir}/usr/share/man/man6/${pkgname}.6"
}

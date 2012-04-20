# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Piotr Beling <qwak@stud.ics.p.lodz.pl>

pkgname=net-bubble
pkgver=0.9.1
pkgrel=3
pkgdesc="A Frozen Bubble clone with a lot of exciting features and nice graphics"
arch=('i686' 'x86_64')
url="http://happypenguin.org/show?net-bubble"
license=('custom')
depends=('sdl_image' 'sdl_net')
source=("http://web.archive.org/web/20070802103627/http://netbubble.zippygraphics.com/files/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.patch"
        "${pkgname}.png"
        "${pkgname}.desktop")
md5sums=('5102f0f7e6139749cb8c8dffa51eee62'
         '99619ce9408b963da9a430e584482434'
         '08c0a00a2e918c92183f4254b3880cd7'
         '955421dd286a7eb8f1483d65f57e5d00')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "../${pkgname}.patch"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install binary
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Install data files
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -r gfx levels "${pkgdir}/usr/share/${pkgname}"

  # Install pixmap and .desktop file
  install -Dm644 "../${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install readme and license
  install -Dm644 README.txt "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

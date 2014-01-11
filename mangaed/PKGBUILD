# Maintainer: Anton Larionov <diffident dot cat at gmail dot com>

pkgname=mangaed
pkgver=2.3
pkgrel=3
pkgdesc="Program for manga translators. It helps to translate manga from Japaneese to any other language."
arch=('i686' 'x86_64')
url="http://mangaed.jumper.su/"
license=('GPL')
depends=('qt5-base')
install=$pkgname.install
source=("http://jumper.su/mangaed/administrator/components/com_filecabinet/uploads/${pkgname}_${pkgver}_src.7z")
md5sums=('d87da12f703006838ba356ea92beb41f')

build() {
  cd "$srcdir/${pkgname}_${pkgver}_src"
  make QMAKE=/usr/bin/qmake
}

package() {
  cd "$srcdir/${pkgname}_${pkgver}_src"

  install -D -m755 MangaEditor "${pkgdir}/usr/bin/${pkgname}"

  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  cp -r share/${pkgname}/* "${pkgdir}/usr/share/${pkgname}"

  install -dm755 "${pkgdir}/usr/share/applications"
  install -m644 "share/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 share/doc/${pkgname}/* "${pkgdir}/usr/share/doc/${pkgname}"

  install -dm755 "${pkgdir}/usr/share/pixmaps"
  install -m644 share/pixmaps/* "${pkgdir}/usr/share/pixmaps"
}

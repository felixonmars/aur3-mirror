# Contributor: Thomas Mudrunka <harvie@@email..cz>
# Maintainer: Thomas Mudrunka <harvie@@email..cz>
# You can also contact me on http://blog.harvie.cz/

pkgname=ocr-a-font
pkgver=10
pkgrel=1
pkgdesc="Free version of OCR-friendly sans-serif monospace TTF font described in 'ISO 1073-1:1976' , 'ANSI X3.4-1977. X3.4' and 'DIN 66008' standarts"
arch=('any')
license=('GPL')
url="http://en.wikipedia.org/wiki/OCR-A_font"
optdepends=('gocr' 'ocra')

source=("OCR-A-10.ttf")
md5sums=('f210e903e883f8be74b911d52cbf06c5')

build() {
  mkdir -p ${pkgdir}/usr/share/fonts/TTF/ || return 1
  cp ${srcdir}/OCR-A-10.ttf ${pkgdir}/usr/share/fonts/TTF/ || return 1
}

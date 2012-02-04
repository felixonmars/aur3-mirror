# Maintainer: 2GMon <t_2gmon@yahoo.co.jp>
pkgname=ttf-menma
pkgver=1.0
pkgrel=1
pkgdesc="anohana original menma font"
arch=(i686 x86_64)
license=('custom')
url="http://www.anohana.jp/special/font.html"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
# The font is only available as a bundle with this driver.
source=(http://www.anohana.jp/special/img/menma_font.zip)

build() {
  cd ${srcdir}/menma_font/
  mkdir -p ${pkgdir}/usr/share/fonts/TTF
  install -m644 *.ttf ${startdir}/pkg/usr/share/fonts/TTF/
}
md5sums=('357a78c18cc17dd11bbb0c1f3cab6585')

# Contributor: Bernhard Tittelbach <xro -at- realraum -dot- at>

pkgname=ttf-unfontscore
pkgver=1.0.2
pkgrel=1
pkgdesc="Un-Fonts Core"
arch=('i686' 'x86_64')
url="http://kldp.net/projects/unfonts/wiki/"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://kldp.net/frs/download.php/4695/un-fonts-core-1.0.2-080608.tar.gz)
md5sums=('87edeb65586b85d4ce10c1fab4f1e1aa')

build() {
  cd "${srcdir}/un-fonts/"
  for ttf in UnBatang.ttf UnBatangBold.ttf UnDotum.ttf UnDotumBold.ttf UnGungseo.ttf UnGraphic.ttf UnGraphicBold.ttf UnDinaru.ttf UnDinaruBold.ttf UnDinaruLight.ttf UnPilgi.ttf UnPilgiBold.ttf; do
    install -Dm644 ${ttf} "${pkgdir}/usr/share/fonts/TTF/${ttf}"
  done
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

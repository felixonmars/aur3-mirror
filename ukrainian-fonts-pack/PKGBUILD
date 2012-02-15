# Maintainer: John Ray <localizator@ukr.net>
pkgname=ukrainian-fonts-pack
pkgver=2
pkgrel=0
pkgdesc="Ukrainian fonts pack for ukrainian users."
arch=('any')
url="http://www.localizator.pp.ua/p/ukfp.html"
license=('GPL')
depends=('fontconfig')
groups=('x11')
install=ukfp.install
source=(https://sourceforge.net/projects/ukfp/files/ukfp.${pkgver}-${pkgrel}.tar.gz)
md5sums=('06f549629f5b47f4d81e5be6bd03fe40')

build() {
  cd ${srcdir}
  mkdir -p ${pkgdir}/usr/share/fonts/truetype/

  install -m644 *.ttf ${pkgdir}/usr/share/fonts/truetype/
}
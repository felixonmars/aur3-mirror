# Contributor : Vladimir Navrat <vn158 at seznam dot cz>

pkgname=ttf-osifont
pkgver=2013.07.30
pkgrel=1
pkgdesc="TrueType font for CAD - ISO 3098"
arch=(i686 x86_64)
license=('LGPL')
url="http://code.google.com/p/osifont/"
install=ttf.install
depends=(xorg-fonts-encodings xorg-fonts-alias xorg-font-utils fontconfig)
source=("http://osifont.googlecode.com/files/osifont-${pkgver//./-}.ttf")
md5sums=('68ae12f13a7ffe73162070d7c45949e9')

package() {
  cd ${startdir}
  mkdir -p ${pkgdir}/usr/share/fonts/TTF
  install -m644 *.ttf ${pkgdir}/usr/share/fonts/TTF/
}
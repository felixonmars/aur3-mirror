# Maintainer: John Beasy <johnbeasy101 at gmail dot com>

pkgname=lambda-icon-theme
pkgver=2
pkgrel=1
pkgdesc="A small build on Faience with custom icons for Cinnamon panel and the Nautilus sidebar"
url="http://ponygon101.deviantart.com/art/Lambda-Icons-309203565"
license=('GPL3')
arch=('any')
makedepends=(faience-icon-theme)
options=(!strip)
source=("http://www.deviantart.com/download/309203565/lambda_icons_by_ponygon101-d543azx.zip")
md5sums=('3fcb144b684fe95fcd4ca4403971363b')

build() {
  cd ${srcdir}
  mkdir -p ${pkgdir}/usr/share/icons
  cp -r Lambda {pkgdir}/usr/share/icons/

}

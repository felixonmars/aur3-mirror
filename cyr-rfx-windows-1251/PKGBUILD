# Contributor: Valeriy Lyasotskiy <onestep at ukr dot net>

pkgname=cyr-rfx-windows-1251
pkgver=1.1
pkgrel=1
pkgdesc="Cyrillic Raster Fonts for X (Windows-1251)"
arch=('i686' 'x86_64')
url="http://www.inp.nsk.su/~bolkhov/files/fonts/cyr-rfx/"
license=('custom')
depends=('libfontenc' 'xorg-fonts-encodings')
makedepends=('gzip')
install=xfonts.install
source=(http://www.inp.nsk.su/~bolkhov/files/fonts/cyr-rfx/${pkgname}-${pkgver}.tgz)
md5sums=('4cfa538dc828855c7133f50cabd45759')

build() {
  cd ${startdir}/src
  mkdir -p ${startdir}/pkg/usr/share/{fonts,cyr-rfx/doc}
  cp -R windows-1251/{75dpi,misc} ${startdir}/pkg/usr/share/fonts || return 1
  cp ${startdir}/src/windows-1251/doc/*LEGALNOTICE ${startdir}/pkg/usr/share/cyr-rfx/doc || return 1
  # clean some unimportant stuff ;)
  find ${startdir}/pkg/usr/share/fonts -name fonts.* -exec rm -f {} \;
  # compress fonts
  gzip ${startdir}/pkg/usr/share/fonts/{75dpi,misc}/* || return 1
}

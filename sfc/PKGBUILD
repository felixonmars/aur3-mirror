# Maintainer: Andreas B. Wagner <AndreasBWagner@gmail.com>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>

pkgname=sfc
pkgver=0.018
pkgrel=1
pkgdesc="A midi router oriented to mix the sounds of your sound devices"
arch=(i686)
url="http://personal.telefonica.terra.es/web/soudfontcombi/soundfontcombi.html"
license=('GPLv2')
depends=('alsa-lib' 'fltk')
source=(http://personal.telefonica.terra.es/web/soudfontcombi/${pkgname}-${pkgver}.tar.gz)
md5sums=('f117cfebf1f3f13f4a3d77d67c8febd6')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}

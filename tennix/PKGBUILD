# Maintainer: Tasos Latsas <tlatsas2000 _at_ gmail _dot_ com>
# Contributor: Nick B <Shirakawasuna at gmail _dot_ com>

pkgname=tennix
pkgver=1.1
pkgrel=1
pkgdesc="An SDL port of a simple two-player tennis game."
arch=('i686' 'x86_64')
url="http://icculus.org/tennix/"
license=('GPL2')
depends=('python2' 'sdl' 'sdl_image' 'sdl_mixer' 'sdl_ttf')
source=(http://icculus.org/tennix/downloads/${pkgname}-${pkgver}.tar.gz)
md5sums=('77cbcf2c948a6641824d55367377374b')

build() {
  cd "${srcdir}/$pkgname-$pkgver"

  # use python2
  sed -i "s/python-config/python2-config/g" makefile

  make PREFIX=/usr
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"

  make PREFIX=/usr DESTDIR=${pkgdir} install
}

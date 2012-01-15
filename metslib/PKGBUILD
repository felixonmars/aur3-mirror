# Maintainer: kfgz <kfgz at interia pl>

pkgname=metslib
pkgver=0.5.3
pkgrel=1
pkgdesc="An OO (Object Oriented) metaheuristics optimization framework in C++"
arch=('i686' 'x86_64')
url="https://projects.coin-or.org/metslib"
license=('GPL3')
conflicts=('metslib-svn' 'metslib-newest')
#provides=("metslib=${pkgver}")
source=(http://www.coin-or.org/download/source/${pkgname}/${pkgname}-${pkgver}.tgz)
md5sums=('abe958de95754786e9d3bcce30d997e7')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  sed -i "s/-O3/-O2/g" configure
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

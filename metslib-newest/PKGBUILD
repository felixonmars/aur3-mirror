# Maintainer: kfgz <kfgz at interia pl>

pkgname=metslib-newest
_real_name=metslib
pkgver=0.5.3
pkgrel=1
pkgdesc="An OO (Object Oriented) metaheuristics optimization framework in C++"
arch=('i686' 'x86_64')
url="https://projects.coin-or.org/metslib"
license=('GPLv3')
conflicts=('metslib-svn' 'metslib')
provides=("metslib=${pkgver}")
source=(http://www.coin-or.org/download/source/${_real_name}/${_real_name}-${pkgver}.tgz)
md5sums=('abe958de95754786e9d3bcce30d997e7')

build() {
  cd ${srcdir}/${_real_name}-${pkgver}
  sed -i "s/-O3/-O2/g" configure
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${_real_name}-${pkgver}
  make DESTDIR=${pkgdir} install
}

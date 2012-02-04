# Author: Elis Axelsson <elis.axelsson@gmail.com>
pkgname=tractorgen
pkgver=0.31.7
pkgrel=1
pkgdesc="Generates tractors"
arch=(i686)
url="http://www.vergenet.net/~conrad/software/tractorgen/" 
license="GPLv2"
#depends=('python' 'python-nautilus' 'nautilus')
source=(http://www.vergenet.net/~conrad/software/tractorgen/dl/tractorgen-$pkgver.tar.gz)
md5sums=('ba6b0483de7933ee9b733b781875bb7d')

build() { 
  cd "${startdir}/src/${pkgname}-${pkgver}/"
  ./configure --prefix=${startdir}/pkg/
  make install
}
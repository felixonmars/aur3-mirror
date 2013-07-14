# Maintainer: Simon Gebert <simon at gebert dot eu>
# Original Package dcp110clpr
# Contributor: ZeroCool <trash4you(at)online(dot).de>

pkgname=brother-dcp110c-lpr
pkgver=1.0.2_1
pkgrel=1
pkgdesc="Official Drivers from Brother for DCP110C printer"
arch=('i686')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/index.html"
license=('GPL' 'custom:brother commercial license')
groups=()
depends=('tcsh')
makedepends=('a2ps')
optdepends=('brother-dcp110c-cupswrapper: cupswrapper for DCP110C printer'
	    'brscan2: scanner support for DCP110C')
confilicts=('dcp110clpr')
source=("http://www.brother.com/pub/bsc/linux/dlf/dcp110clpr-${pkgver/_/-}.i386.deb" ${pkgname}-${pkgver}.patch)
md5sums=('c19161e15e84566f26e5f4243f1aae97'
         '004e1929e7d028f77de77b8f62007711')
build() {
  cd $srcdir
  tar xzvf data.tar.gz || return 1
  cd $srcdir/usr
  patch -Np1 -i $srcdir/${pkgname}-${pkgver}.patch || return 1
  mkdir -p $srcdir/opt/brother
  cp -R $srcdir/usr/local/Brother/* $srcdir/opt/brother
  rm -R $srcdir/usr/local
}
package() {
  mkdir -p $pkgdir/usr
  mkdir -p $pkgdir/opt 
  cp -R $srcdir/usr/* $pkgdir/usr
  cp -R $srcdir/opt/* $pkgdir/opt
}

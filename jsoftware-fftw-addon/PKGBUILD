# Contributor: Lorenzo Tomei <tomeil@tiscali.it>

pkgname=jsoftware-fftw-addon
pkgver=1.1.2
pkgrel=3
pkgdesc="addon to interface FFTW library in J programming language"
arch=('i686')
url="http://www.jsoftware.com"
license=('custom:jsoftware')
depends=('jsoftware')
source=(http://www.databaserossoverde.it/jsoftware/math_fftw_${pkgver}_linux.tar.gz)
md5sums=('f8ec2d783d42bd23572c9a09dac314bd')

build() {
  cd $startdir/src
  mkdir -p $startdir/pkg/usr/lib/j/addons
  cp -a math $startdir/pkg/usr/lib/j/addons/
}

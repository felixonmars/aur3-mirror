# Contributor: Christoph 'delmonico' Neuroth <delmonico@gmx.net> 
pkgname=fuzzyclock
pkgver=0.3
pkgrel=1 
pkgdesc='A python class and commandline utility to generate a "fuzzy clock" output.'
url='https://gna.org/projects/fuzzyclock/'
depends=('python') 
source=(http://download.gna.org/fuzzyclock/src/fuzzyclock-$pkgver.tar.gz)
md5sums=('4683bce6f77daa324e13974bd2b82bdb')

build() { 
  cd $startdir/src/$pkgname-$pkgver
  python setup.py install --prefix=$startdir/pkg/usr
}

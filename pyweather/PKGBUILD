# Contributor: Mark Tran <mark@nirv.net>

pkgname=pyweather
pkgver=0.7.0
pkgrel=1
pkgdesc="A collection of meteorological conversion functions, station readers, and publishing modules."
url="http://oss.wxnet.org/pyweather/"
license="GPL"
depends=('python')
source=(http://dl.sourceforge.net/meta-tools/weather-$pkgver.tar.gz)
md5sums=('ce547183f7b455d837d654a484b29a83')

build() {
   cd $startdir/src/weather-$pkgver

   python setup.py build || return 1
   python setup.py install --root=$startdir/pkg
}

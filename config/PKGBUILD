# Contributor: no4 <matej.horvath@gmail.com>

pkgname=config
pkgver=0.3.7
pkgrel=4
pkgdesc="a python module for the configuration file management"
url="http://www.red-dove.com/python_config.html"
license="Python Software Foundation License"
depends=('python')
source=(http://www.red-dove.com/$pkgname-$pkgver.tar.gz)
arch=('i686' 'x86_64')
md5sums=('71a0dec1e627f830a767fcdd798b0d31')

build() {
  mkdir -p $startdir/pkg/
  cd $startdir/src/$pkgname-$pkgver
  python setup.py install --root=$startdir/pkg/
}

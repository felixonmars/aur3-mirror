# Maintainer: Kevin Maeder <kmaeder[AT]kevin-maeder[dot]de>

pkgname=python-nptdms
pkgver=0.6.2
pkgrel=1
pkgdesc="Numpy based TDMS file reader"
arch=('i686' 'x86_64')
url="https://github.com/adamreeve/npTDMS"
license=('LGPL')
depends=('python' 'python-numpy')
makedepends=('python-setuptools')

source=("https://github.com/adamreeve/npTDMS/archive/${pkgver}.tar.gz")
md5sums=('67634a5ebae883c7e0168eb4430648b9')

build() {
  cd "$srcdir/npTDMS-${pkgver}"

  # remove tests
  sed -i s/\'nptdms.test\'//g setup.py
  rm -R "nptdms/test"

  python setup.py build
}

package() {
  cd "$srcdir/npTDMS-${pkgver}"

  python setup.py install --root="$pkgdir"/ --optimize=1
}

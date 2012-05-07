# Maintainer: Vinicius de Avila Jorge <vinicius.avila.jorge@gmail.com>

pkgname=adium-theme-ubuntu
pkgver=0.3.2
pkgrel=1
pkgdesc="Adium message style for Ubuntu"
arch=('any')
url="https://launchpad.net/adium-theme-ubuntu"
license=('BSD' 'custom:AFL')
makedepends=('python-distutils-extra')
optdepends=('empathy')
source=(https://launchpadlibrarian.net/90831300/$pkgname-$pkgver.tar.gz)
md5sums=('62454dfa385617913507cf62d52409bf')

build() {
   cd $srcdir/$pkgname-$pkgver

  python2 ./setup.py build
  python2 ./setup.py install --prefix=/usr --root=$pkgdir
}

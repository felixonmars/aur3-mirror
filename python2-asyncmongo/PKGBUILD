pkgname=python2-asyncmongo
pkgver=0.1.3
pkgrel=1
pkgdesc='asynchronous mongodb driver that integrates with the tornado ioloop'
arch=('any')
url="http://www.github.com/bitly/asyncmongo/"
license=('Apache')
depends=('python>=2.7' 'python2-tornado')
makedepends=('python2-distribute')
source=(https://github.com/downloads/bitly/asyncmongo/asyncmongo-$pkgver.tar.gz)
md5sums=('969f37ca00636d799648c87814e4405e')

build() {
  cd asyncmongo-$pkgver

  python2 ./setup.py install --root=$pkgdir --prefix=/usr || return 1
}


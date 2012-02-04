pkgname=python-tornado
pkgver=2.1.1
pkgrel=1
pkgdesc='open source version of the scalable, non-blocking web server and tools that power FriendFeed'
arch=('any')
url="http://www.tornadoweb.org/"
license=('Apache')
depends=('python>=3.1')
makedepends=('python-distribute')
source=(https://github.com/downloads/facebook/tornado/tornado-$pkgver.tar.gz)

build() {
  cd tornado-$pkgver

  python ./setup.py install --root=$pkgdir --prefix=/usr || return 1
}

md5sums=('3cfa12efec87a26e013128388e1e6aa7')

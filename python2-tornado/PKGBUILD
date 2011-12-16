pkgname=python2-tornado
pkgver=2.1.1
pkgrel=2
pkgdesc='open source version of the scalable, non-blocking web server and tools that power FriendFeed'
arch=('any')
url="http://www.tornadoweb.org/"
license=('Apache')
depends=('python2>=2.7')
makedepends=('python2-distribute')
source=(https://github.com/downloads/facebook/tornado/tornado-$pkgver.tar.gz)

build() {
  cd tornado-$pkgver

  python2 ./setup.py install --root=$pkgdir --prefix=/usr || return 1
}

md5sums=('3cfa12efec87a26e013128388e1e6aa7')

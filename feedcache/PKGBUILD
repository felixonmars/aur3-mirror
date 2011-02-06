# Maintainer: M Rawash <mrawash@gmail.com>

pkgname=feedcache
pkgver=1.3.1
pkgrel=1
pkgdesc="Wrapper for Mark Pilgrim's FeedParser module which caches feed content"
url="http://www.doughellmann.com/projects/feedcache/"
arch=('any')
license=('custom')
depends=('python-feedparser')
source=(http://www.doughellmann.com/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('755de0bda07aca38ab9cbc17e8e14ecf')

build() {
	cd "$srcdir/$pkgname-$pkgver"

  python setup.py build
  python setup.py install --root=${pkgdir}
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/license
}

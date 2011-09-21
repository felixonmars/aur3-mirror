# -*- shell-script -*-

python=python2
name=bottle-sqlite

pkgname=$python-$name
pkgver=0.1
pkgrel=1
pkgdesc=""
arch=(any)
url=http://bottlepy.org/docs/dev/plugins/sqlite.html
license=(MIT)
depends=($python-bottle)
source=(http://pypi.python.org/packages/source/b/$name/$name-$pkgver.tar.gz)

build() {
  cd $srcdir/$name-$pkgver
  $python setup.py install --prefix=/usr --root=$pkgdir
}
md5sums=('0ee58a72e4aa490700b274c61154862d')

# Contributor: Roberto Alsina <ralsina@kde.org>
pkgname=python-iterpipes
pkgver=0.4
pkgrel=3
pkgdesc="A library for running shell pipelines using shell-like syntax"
arch=('any')
url="http://iterpipes.pirx.ru/"
license=('custom')
depends=('python2')
source=( http://pypi.python.org/packages/source/i/iterpipes/iterpipes-$pkgver.tar.gz)

build() {
  cd $startdir/src/iterpipes-$pkgver
  install -D LICENSE $startdir/pkg/usr/share/licenses/python-iterpipes/COPYING
  python2 setup.py install --root=$startdir/pkg || return 1
}
md5sums=('49273f11b8888d565eed58b6f2702a06')

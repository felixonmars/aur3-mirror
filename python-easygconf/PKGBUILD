# Contributor: Kozec <kozec.at.kozec.dot.com>

pkgname=python-easygconf
pkgver=0.03
pkgrel=4
pkgdesc="Easygconf provides an easy, pythonic way to access GConf through a dict-like interface."
arch=(i686 x86_64)
url="http://www.florian-diesch.de/software/easygconf/"
license=('BSD')
depends=('python2' 'gconf' 'python2-setuptools')
source=("http://www.florian-diesch.de/software/easygconf/dist/easygconf-$pkgver".tar.gz)
md5sums=('654e9d5a593b95badd1e7656e2ee1963')

build() {
  cd $srcdir/easygconf-$pkgver
  python2 setup.py install --root=$pkgdir/ --optimize=1 || return 1
}

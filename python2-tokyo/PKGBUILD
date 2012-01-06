# Contributor: Wes Brown <wesbrown18@gmail.com>
pkgname=python2-tokyo
pkgver=0.7.0
pkgrel=1
pkgdesc="This is a set of Python interfaces to the Tokyo libraries."
arch=('any')
url=("http://pypi.python.org/pypi/tokyo-python/")
license=('GPL')
depends=('python2' 'tokyocabinet')
makedepends=('tokyocabinet')
source=('http://pypi.python.org/packages/source/t/tokyo-python/tokyo-python-0.7.0.tar.gz')
md5sums=('8e8a61c01bacaa47218778500fca1209')

build() {
  cd "$srcdir/tokyo-python-${pkgver}"
  python2 setup.py build install --root="${pkgdir}" || return 1
}

# vim:set ts=2 sw=2 et:

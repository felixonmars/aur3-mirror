# Maintainer: Vladimir Tsanev <tsachev@gmail.com>
pkgname=python-scales
pkgver=1.0.7
pkgrel=2
pkgdesc="Stats for Python processes"
arch=('any')
url="https://www.github.com/Cue/scales"
license=('BSD')
makedepends=('python-distribute')
depends=('python-simplejson' 'python-six' 'python')
optdepends=('python-flask' 'python-twisted' 'python-bottle' 'python-tornado')
source=(http://pypi.python.org/packages/source/s/scales/scales-$pkgver.tar.gz)
md5sums=('f834e31da23046ddef48fb636e48558f')

package() {
  cd $srcdir/scales-$pkgver
  python setup.py install --root=$pkgdir || return 1
} 

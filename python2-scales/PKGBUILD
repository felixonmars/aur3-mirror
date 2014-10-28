# Maintainer: Vladimir Tsanev <tsachev@gmail.com>
pkgname=python2-scales
pkgver=1.0.7
pkgrel=2
pkgdesc="Stats for Python processes"
arch=('any')
url="https://www.github.com/Cue/scales"
license=('BSD')
makedepends=('python2-distribute')
depends=('python2-simplejson' 'python2-six' 'python2')
optdepends=('python2-flask' 'python2-twisted' 'python2-bottle' 'python2-tornado')
source=(http://pypi.python.org/packages/source/s/scales/scales-$pkgver.tar.gz)
md5sums=('f834e31da23046ddef48fb636e48558f')

package() {
  cd $srcdir/scales-$pkgver
  python2 setup.py install --root=$pkgdir || return 1
} 

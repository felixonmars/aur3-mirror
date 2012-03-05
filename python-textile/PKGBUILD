# Maintainer: Mike Sampson <mike at sambodata dot com>
# Contributor: Nicolas Doualot <packages@slubman.info>

_basename=textile
pkgname=python-textile
pkgver=2.1.5
pkgrel=1
pkgdesc="A Python textile to XHTML generator"
arch=('any')
depends=('python2')
makedepends=('python2-distribute')
license=('BSD')
source=(http://cheeseshop.python.org/packages/source/t/$_basename/$_basename-$pkgver.tar.gz
LICENSE)
md5sums=('6e030e112eca1dafa1be84cf5575560d'
         'f383d5f14cdf6278ee7704cf2234f4b8')
url="http://cheeseshop.python.org/pypi/textile"

package() {
   cd $srcdir/$_basename-$pkgver
   python2 ./setup.py install --root="$pkgdir/" --optimize=1
   install -D $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}


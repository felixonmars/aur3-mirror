# Maintainer: Teemu Rytilahti <tpr@iki.fi>
pkgname=pythonect
_pkgname=Pythonect
pkgver=0.5.0
pkgrel=1
pkgdesc="A general-purpose dataflow programming language written in Python"
arch=('any')
url="http://www.pythonect.org/"
license=('BSD')
groups=()
depends=('python2' 'python2-ply')
options=(!emptydirs)
#https://pypi.python.org/packages/source/P/Pythonect/Pythonect-0.5.0.tar.gz#md5=66d79428a5dd98411c9cfbe533b827b5
source=($_pkgname-$pkgver.tar.gz)
md5sums=('66d79428a5dd98411c9cfbe533b827b5')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  rm "$pkgdir/usr/LICENSE"
}

# vim:set ts=2 sw=2 et:

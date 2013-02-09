# Maintainer: Oliver Sherouse <first DOT last AT gmail DOT com>
_pkgname=relaxml
pkgname=python-$_pkgname
pkgver=0.1.3
pkgrel=1
pkgdesc="Converting XML to a dictionary should be easy -- and fast."
arch=('any')
url="https://github.com/zachwill/relaxml"
license=('custom')
depends=('python')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/r/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('c4d920398b612aa761abdac3968b5a71')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

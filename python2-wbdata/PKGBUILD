# Maintainer: Oliver Sherouse <oliver DOT sherouse AT gmail DOT com>
_pkgname=wbdata
pkgname=python2-$_pkgname
pkgver=0.2.1
pkgrel=1
pkgdesc="A python library for accessing World Bank data"
arch=('any')
url="https://github.com/oliversherouse/wbdata"
license=('GPL')
groups=()
depends=('python2-decorator')
optdepends=('python2-pandas: pandas functionality')
options=(!emptydirs)
source=(http://pypi.python.org/packages/source/w/wbdata/$_pkgname-$pkgver.tar.gz)
md5sums=('015bede2a0cc3d848716290f46981616')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

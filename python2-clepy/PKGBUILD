# Maintainer: Eugene Nikolsky <pluton dot od at gmail dot com>

_pkgname=clepy
pkgname=python2-${_pkgname}
pkgver=0.3.20
pkgrel=1
pkgdesc="Utilities from the Cleveland Python user group"
arch=(any)
url="http://pypi.python.org/pypi/clepy/"
license=('MIT')
depends=('python2' 'python2-mock' 'python2-nose' 'python-decorator')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/c/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('4059eb9300357ce802e4ee9885b3cc12')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

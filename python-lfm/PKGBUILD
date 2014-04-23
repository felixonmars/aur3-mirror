# Maintainer: Никола Вукосављевић <hauzer@gmx.com>

_pkgname=lfm
_pypipkgname=${_pkgname}h
pkgname=python-${_pkgname}
pkgver=1.1.1
pkgrel=1
pkgdesc='A Last.fm API interface.'
arch=('any')
url='https://bitbucket.org/hauzer/${_pkgname}/'
license=('GPL')
depends=('python' 'python-requests')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/l/${_pypipkgname}/${_pypipkgname}-${pkgver}.zip")
sha512sums=('7d9eac7e8c3569b57bb653dbd528793d55e401dff226caa2685305946b2c365614658ea75254bde4e584344cb6beaf4dd1d72d6abaff811da8a6a6c4d623af96')

package() {
  cd "${srcdir}/${_pypipkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}


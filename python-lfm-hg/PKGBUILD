# Maintainer: Никола Вукосављевић <hauzer@gmx.com>

_pkgname=lfm
pkgname=python-${_pkgname}-hg
pkgver=0.0.0
pkgrel=1
pkgdesc='A Last.fm API interface. (hg)'
arch=('any')
url='https://bitbucket.org/hauzer/${_pkgname}/'
license=('GPL')
depends=('python' 'python-requests')
makedepends=('python-setuptools')
provides=('python-lfm')
conflicts=('python-lfm')
options=(!emptydirs)
source=("hg+https://bitbucket.org/hauzer/${_pkgname}/")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}


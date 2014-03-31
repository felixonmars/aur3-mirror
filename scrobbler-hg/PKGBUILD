# Maintainer: Никола Вукосављевић <hauzer@gmx.com>

_pkgname=scrobbler
pkgname=${_pkgname}-hg
pkgver=0.0.0
pkgrel=1
pkgdesc='A command-line Last.fm scrobbler and a now-playing status updater. (hg)'
arch=('any')
url='https://bitbucket.org/hauzer/${_pkgname}/'
license=('GPL')
depends=('python' 'python-appdirs' 'python-docopt' 'python-lfm')
makedepends=('python-setuptools')
provides=('scrobbler')
conflicts=('scrobbler')
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


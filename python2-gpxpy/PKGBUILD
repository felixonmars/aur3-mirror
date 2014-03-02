# Maintainer: David Verelst <david point verelst at gmail dot com>

pkgname=python2-gpxpy
_gitname=gpxpy
pkgver=332.e4f8dd1
pkgrel=1
pkgdesc="Python GPX (GPS eXchange format) parser"
arch=(any)
url="https://github.com/tkrajina/gpxpy"
license=('Apache')
depends=('python>=2.6' 'python-lxml>=3.1.2')
makedepends=('python-distribute')
provides=()
conflicts=(python2-gpxpy)
replaces=()
backup=()
options=(!emptydirs)
source=('git://github.com/tkrajina/gpxpy.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  #git describe --always | sed 's|-|.|g'
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
   cd $_gitname
   python2 setup.py install --root="${pkgdir}" --optimize=1 || exit 1
}

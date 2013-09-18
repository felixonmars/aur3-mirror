# Maintainer: juantascon
# Contributor: Army

_pkgname=tvcmd
pkgname=$_pkgname-git
pkgver=v0.8.3.0.g80ff813
pkgrel=2
pkgdesc="tvcmd is a command line tool to keep track of tv shows episodes"
arch=('any')
url="http://tvcmd.horlux.org"
license=('GPL3')
depends=('python-httplib2')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname"::'git://github.com/juantascon/tvcmd.git')
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  local ver="$(git describe --long --tags)"
  printf "%s" "${ver//-/.}"
}

package() {
  cd "$pkgname"
  python setup.py install --root "$pkgdir"
}

# vim:set ts=2 sw=2 et:

# Maintainer: Quint Guvernator <quintus.public@gmail.com>
pkgname=loadaverage
pkgver=20131206
pkgrel=1
pkgdesc="Simple Multi-Purpose Adjusted Load Averages"
arch=('any')
url="http://github.com/qguv/loadaverage/"
license=('GPL3')
depends=('python>=3.3')
makedepends=('git')
conflicts=('load')
provides=('load')
source=("$pkgname"::git://github.com/qguv/loadaverage.git)
md5sums=('SKIP') # Because the sources are not static, skip Git checksum

pkgver() {
  cd "$pkgname"
  local ver=$(git describe --always)
  printf "%s\n" "${ver//-/.}"
}

package() {
  cd "$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:


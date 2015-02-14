# Maintainer: Thomas Marchsteiner <tommy[0x2e]m86[0x40]gmail[0x2e]com>
pkgname=python-beaver-git
_pkgname=python-beaver
pkgver=33.1.0.r0.gf5352b0
pkgrel=1
pkgdesc="Lightwight logstash shipper"
arch=(any)
url="https://github.com/josegonzalez/python-beaver"
license=('MIT')
depends=('python')
optinaldepends=('python-pyzmq':0MQ Support)
makedepends=('git')
provides=('python-beaver')
options=(!emptydirs)
source=('git+https://github.com/josegonzalez/python-beaver.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
  
  install -d ${pkgdir}/usr/share/doc/$pkgname
  install -d ${pkgdir}/usr/share/licenses/$pkgname
 
  install -Dm644 ${srcdir}/$_pkgname/CHANGES.rst ${pkgdir}/usr/share/doc/$pkgname/CHANGELOG
  install -Dm644 ${srcdir}/$_pkgname/README.rst ${pkgdir}/usr/share/doc/$pkgname/README.rst
  install -Dm644 ${srcdir}/$_pkgname/LICENSE.txt ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
  }

# vim:set ts=2 sw=2 et:
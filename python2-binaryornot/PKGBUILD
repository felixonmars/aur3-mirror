# Maintainer: Meir Kriheli <mkriheli@gmail.com>

pkgname=python2-binaryornot
_pkgname=binaryornot
pkgver=0.3.0
pkgrel=1
pkgdesc="Ultra-lightweight pure Python package to check if a file is binary or text"
arch=('any')
url="https://github.com/audreyr/binaryornot"
license=('BSD')
groups=('devel')
depends=('python2')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=("https://github.com/audreyr/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=(8ef002b896a5f93b9875d78ffa3cf666)

package() {
      cd "$srcdir/${_pkgname}-${pkgver}"
      python2 setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:

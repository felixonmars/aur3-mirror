# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname='python2-pybuspirate-git'
pkgver=681b4ee
pkgrel=1
pkgdesc="Library for the Hack-A-Day Bus Pirate"
url="https://github.com/audiohacked/pyBusPirate"
arch=('any')
license=('GPL3')
depends=('python2')
source=('git+https://github.com/audiohacked/pyBusPirate.git')
sha512sums=('SKIP')

pkgver() {
  cd "$SRCDEST/${_pkgname}"
  git describe --always | sed 's|-|.|g'
}

package() {
  cd $srcdir/pyBusPirate
  python2 setup.py install --root="$pkgdir/"
}

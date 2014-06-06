# Maintainer: Audric Schiltknecht <storm+arch@chemicalstorm.org>

pkgname=python2-prctl
pkgver=1.5.0
pkgrel=2
pkgdesc="Python interface to the prctl() syscall"
arch=('i686' 'x86_64')
url="https://github.com/seveas/python-prctl"
license=('GPL3')
depends=('python2' 'libcap')
makedepends=()
options=(!emptydirs)
install=
source=("https://github.com/seveas/python-prctl/tarball/v${pkgver}")
md5sums=('22862c5c6efc0adfee9dab1a6adffc5b')

package() {
  cd "$srcdir/seveas-python-prctl-5ef0b17/"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

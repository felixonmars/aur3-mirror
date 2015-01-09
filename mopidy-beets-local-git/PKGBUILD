# Maintainer: Frederik "Freso" S. Olesen <freso.dk@gmail.com>

_pkgname=mopidy-beets-local
pkgname=${_pkgname}-git
pkgver=0.4.r4.g088b3b0
pkgrel=1
pkgdesc='Mopidy extension for accessing a local beets library.'
arch=('any')
url="https://github.com/rawdlite/${_pkgname}"
license=('Apache')
depends=('python2' 'mopidy' 'beets')
makedepends=('git')
provides=("$_pkgname")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 README.rst "$pkgdir/usr/share/doc/${_pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:

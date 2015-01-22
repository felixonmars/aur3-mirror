# Maintainer: Frederik "Freso" S. Olesen <freso.dk@gmail.com>

_pkgname=mopidy-local-sqlite
pkgname=${_pkgname}-git
pkgver=0.9.2.r0.ga5b9026
pkgrel=1
pkgdesc='Mopidy extension for using SQLite as backend for the local library.'
arch=('any')
url="https://github.com/tkem/${_pkgname}"
license=('Apache')
depends=('python2' 'mopidy' 'python2-uritools')
makedepends=('git')
checkdepends=('python2-nose' 'python2-mock')
provides=("$_pkgname")
conflicts=$provides
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

check() {
  cd "$srcdir/$_pkgname"
  python2 setup.py nosetests
}

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -d "$pkgdir/usr/share/doc/${_pkgname}/"
  install -pm644 CHANGES.rst README.rst "$pkgdir/usr/share/doc/${_pkgname}/"
}

# vim:set ts=2 sw=2 et:

# Maintainer: Chris van Dijk (quigybo) <quigybo at hotmail dot com>

pkgname=python2-nosqlite-git
_pkgname=python2-nosqlite
_gitname=nosqlite
pkgver=39.5de6fba
pkgrel=1
pkgdesc="A lightweight zeroconf noSQL document-oriented forking Python SQLite networked authenticated XMLRPC database server"
arch=('any')
url="http://code.google.com/p/nosqlite/"
license=('BSD')
depends=('python2' 'sqlite3')
makedepends=('python2-setuptools' 'git')
provides=('python2-nosqlite')
conflicts=('python2-nosqlite')
source=('git+https://github.com/williamstein/nosqlite.git')
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  local ver="$(git describe --long 2>/dev/null)"
  if [[ -n "$ver" ]]; then
    printf '%s' "${ver//-/.}"
  else
    printf '%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

package() {
  cd "$_gitname"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 README.txt "${pkgdir}/usr/share/licenses/${_pkgname}/README"
}

# vim:set ts=2 sw=2 et:

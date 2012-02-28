# Maintainer: orbisvicis <''.join(chr(ord(c)-1) for c in "pscjtwjdjtAhnbjm/dpn")>
pkgname=playerdo-hg
pkgver=69
pkgrel=1
pkgdesc="Control various media players from a single command line interface."
arch=("any")
url="https://bitbucket.org/spookylukey/playerdo"
license=("BSD")
depends=("python2" "dbus-python")
makedepends=("mercurial")
provides=("${pkgname%-hg}")
conflicts=("${pkgname%-hg}")
backup=()
options=()
install=

_hgrepo="${pkgname%-hg}"
_hgroot="${url%/${_hgrepo}}"

build() {
  cd "$srcdir"

  rm -rf "${srcdir}/${_hgrepo}-build"
  cp -r "${srcdir}/${_hgrepo}" "${srcdir}/${_hgrepo}-build"
  cd "${srcdir}/${_hgrepo}-build"

  python2 setup.py build
}

package() {
  cd "${srcdir}/${_hgrepo}-build"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname%-hg}"
  install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname%-hg}/"
}

# vim:set ts=2 sw=2 et:

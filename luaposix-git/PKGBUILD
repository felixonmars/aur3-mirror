# Maintainer: Sam Stuewe <halosghost at archlinux dot info>
_name=luaposix
pkgname="${_name}-git"
pkgver=510.6185e2b
pkgrel=1
pkgdesc="Lua bindings for POSIX APIs"
arch=('i686' 'x86_64')
url="http://luaposix.github.com/${_name}"
license=('MIT')
makedepends=('git' 'help2man')
depends=('lua' 'ncurses')
source=("${_name}::git+https://github.com/${_name}/${_name}.git")
sha256sums=('SKIP')

pkgver () {
  cd "${_name}"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare () {
  cd "${_name}"

  cat <<EOF >> .gitmodules
[submodule "gnulib"]
	path=gnulib
	url=git://git.savannah.gnu.org/gnulib.git
EOF

  ./bootstrap
}

build () {
  cd "${_name}"
  ./configure --prefix='/usr' \
              --libdir='/usr/lib/lua/5.2' \
              --datadir='/usr/share/lua/5.2'

  MAKEFLAGS="" make all
}

package () {
  cd "${_name}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim:set ts=2 sw=2 et:

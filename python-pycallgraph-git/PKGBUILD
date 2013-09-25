# Maintainer: Chris van Dijk (quigybo) <quigybo at hotmail dot com>
# Contributor: Tocer Deng <tocer.deng@gmail.com>

pkgname=python-pycallgraph-git
_gitname=pycallgraph
pkgver=248.35d6465
pkgrel=1
pkgdesc="A Python module that creates call graphs for Python programs"
arch=('any')
url="https://github.com/gak/pycallgraph"
license=('GPL2')
depends=('python' 'graphviz')
makedepends=('python-setuptools' 'git')
provides=('python-pycallgraph' 'pycallgraph')
conflicts=('pycallgraph')
source=('git+https://github.com/gak/pycallgraph.git')
md5sums=('SKIP')

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
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 man/pycallgraph.1 "${pkgdir}/usr/share/man/man1/pycallgraph.1"
}

# vim:set ts=2 sw=2 et:

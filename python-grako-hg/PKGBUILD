# Maintainer: Jakub Klinkovský <j.l.k@gmx.com>

pkgname=python-grako-hg
pkgdesc="Grammar compiler that takes grammars in a variation of EBNF as input, and outputs memoizing (Packrat) PEG parsers in Python"
pkgver=1778.ccc0cdf5f3ff
pkgrel=1
arch=('any')
url="https://bitbucket.org/apalala/grako"
license=('BSD')
depends=('python')
makedepends=('mercurial')
source=('hg+https://bitbucket.org/apalala/grako')
md5sums=('SKIP')

_gitname=grako

pkgver() {
  cd "$_gitname"
  printf "%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "$_gitname"
  python setup.py build
}

package() {
  cd "$_gitname"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:

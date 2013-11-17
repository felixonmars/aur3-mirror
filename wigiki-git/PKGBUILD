# Maintainer: Tasos Latsas <tlatsas@gmx.com>
pkgname=wigiki-git
_gitname=wigiki
pkgver=0.6.2
pkgrel=1
pkgdesc="Static html wiki generator using Github's Gists as pages"
arch=('any')
url="https://github.com/tlatsas/wigiki"
license=('MIT')
depends=('python' 'python-jinja')
#optdepends=()
makedepends=('git')
provides=('wigiki')
conflicts=('wigiki')
source=('git+https://github.com/tlatsas/wigiki.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

package() {
  cd $_gitname
  python setup.py install --root="$pkgdir" --optimize=1
  install -D LICENSE $pkgdir/usr/share/licenses/$_gitname/LICENSE
}

# vim:set ts=2 sw=2 et:

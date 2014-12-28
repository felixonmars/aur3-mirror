# Maintainer: Jakub Klinkovský <j.l.k@gmx.com>

pkgname=python-smc-git
pkgdesc="A MediaWiki parser for python"
pkgver=69.5e54ccb
pkgrel=1
arch=('any')
url="https://github.com/lambdafu/smc.mw"
license=('BSD')
depends=('python' 'python-grako-hg')
makedepends=('git')
source=('git://github.com/lambdafu/smc.mw.git')
md5sums=('SKIP')

_gitname=smc.mw

pkgver() {
  cd "$_gitname"
  echo "$(git rev-list --count HEAD).$(git describe --always )"
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

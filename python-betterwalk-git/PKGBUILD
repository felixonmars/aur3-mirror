# Maintainer: Jakub Klinkovský <kuba.klinkovsky@gmail.com>

pkgname=python-betterwalk-git
pkgdesc="BetterWalk, a better and faster os.walk() for Python."
pkgver=49.431227a
pkgrel=1
arch=('any')
url="https://github.com/benhoyt/betterwalk"
license=('BSD')
depends=('python')
makedepends=('git')
source=('git://github.com/benhoyt/betterwalk.git')
md5sums=('SKIP')

_gitname=betterwalk

pkgver() {
  cd "$_gitname"
  echo "$(git rev-list --count HEAD).$(git describe --always )"
}

package() {
  cd "$_gitname"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize 1
}

# vim:set ts=2 sw=2 et:

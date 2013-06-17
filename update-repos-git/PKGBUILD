# Contributor: Felix Kaiser <felix.kaiser@fxkr.net>
#
# @Git users: This is a PKGBUILD for Arch Linux.
# @Arch users: This file is included in the git repo.

pkgname=update-repos-git
pkgver=0.1.2
pkgrel=1
pkgdesc="Updates all source code repositories in a directory"
url='https://github.com/fxkr/update-repos'
license=('BSD')
depends=('python2')
arch=('any')
source=('update-repos-git::git://github.com/fxkr/update-repos.git')
md5sums=('SKIP')

pkgver() {
  # Use tag of latest commit
  cd "$srcdir/update-repos-git"
  git describe --always | sed -e 's|-|.|g' -e 's|v||'
}

build() {
  cd "$srcdir/update-repos-git"
  python2 setup.py build
}

package() {
  cd "$srcdir/update-repos-git"
  python2 setup.py install --optimize=1 --root="$pkgdir"
}


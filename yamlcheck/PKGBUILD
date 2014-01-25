# Contributor: Felix Kaiser <felix.kaiser@fxkr.net>
#
# @Git users: This is a package build description file for Arch Linux.
# @Arch users: This file is included in the projects git repository.

pkgname=yamlcheck
pkgver=0.1.2
pkgrel=1
pkgdesc="Check if files adhere to YAML syntax"
url='https://github.com/fxkr/yamlcheck'
license=('BSD')
depends=('python2')
arch=('any')
source=('yamlcheck-git::git://github.com/fxkr/yamlcheck.git')
md5sums=('SKIP')

pkgver() {
  # Use tag of latest commit
  cd "$srcdir/yamlcheck-git"
  git describe --always | sed -e 's|-|.|g' -e 's|v||'
}

build() {
  cd "$srcdir/yamlcheck-git"
  python2 setup.py build
}

package() {
  cd "$srcdir/yamlcheck-git"
  python2 setup.py install --optimize=1 --root="$pkgdir"
}


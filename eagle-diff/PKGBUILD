# Contributor: Felix Kaiser <felix.kaiser@fxkr.net>
#
# @Git users: This is a package build description file for Arch Linux.
# @Arch users: This file is included in the projects git repository.

pkgname=eagle-diff
pkgver=0.1.0
pkgrel=1
pkgdesc="Show differences between Cadsoft Eagle files"
url='https://github.com/fxkr/eagle-diff'
license=('BSD')
depends=('python2' 'python2-imaging')
arch=('any')
source=('eagle-diff-git::git://github.com/fxkr/eagle-diff.git')
md5sums=('SKIP')

pkgver() {
  # Use tag of latest commit
  cd "$srcdir/eagle-diff-git"
  git describe --always | sed -e 's|-|.|g' -e 's|v||'
}

build() {
  cd "$srcdir/eagle-diff-git"
  python2 setup.py build
}

package() {
  cd "$srcdir/eagle-diff-git"
  python2 setup.py install --optimize=1 --root="$pkgdir"
  install -Dm644 eagle-diff.1 "$pkgdir/usr/share/man/man1/eagle-diff.1"
}


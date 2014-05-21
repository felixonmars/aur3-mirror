# Maintainer: Fazlul Shahriar <fshahriar@gmail.com>
#
# Repository: https://github.com/fhs/archlinux-packages
pkgname=python-mdp
pkgver=3.3
pkgrel=1
pkgdesc="Modular toolkit for Data Processing"
arch=(any)
url="http://mdp-toolkit.sourceforge.net/index.html"
license=(LGPL3)
depends=(python python-numpy)
source=("http://downloads.sourceforge.net/project/mdp-toolkit/mdp-toolkit/$pkgver/MDP-$pkgver.tar.gz")
md5sums=('5956284a419a431a980129485f111602')

build() {
  cd "$srcdir/MDP-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/MDP-$pkgver"
  python setup.py install --root=$pkgdir
}

# vim:set ts=2 sw=2 et:

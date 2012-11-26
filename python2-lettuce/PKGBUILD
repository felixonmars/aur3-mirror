# Maintainer: Karol "Kenji Takahashi" Wozniak <wozniakk@gmail.com>

pkgname=python2-lettuce
pkgver=0.2.11
pkgrel=1
pkgdesc="Behaviour Driven Development for python."
arch=(any)
url="http://lettuce.it/"
license=('GPL3')
depends=('python2' 'python2-fuzzywuzzy-git' 'python2-sure' 'python2-nose')
optdepends=()
provides=('python2-lettuce')
options=(!emptydirs)
source=("http://pypi.python.org/packages/source/l/lettuce/lettuce-$pkgver.tar.gz")
md5sums=('81d0abc462d6a164a4515093fa43056c')

build() {
    cd $srcdir/lettuce-$pkgver
    python2 setup.py install --root=$pkgdir/ --optimize=1
}

# vim:set ts=4 sw=4 et:

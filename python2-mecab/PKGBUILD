# Maintainer: wice <clementskau+aur-python2-mecab - gmail>
pkgname=python2-mecab
pkgver=0.996
pkgrel=1
pkgdesc="Morphological Analysis Tool - Python interface"
arch=('i686' 'x86_64')
url="http://mecab.sourceforge.net/"
license=('BSD' 'LGPL' 'GPL')
groups=()
depends=("python2" "mecab")
makedepends=("gcc")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://mecab.googlecode.com/files/mecab-python-$pkgver.tar.gz")
sha1sums=('b7801d78b4def5118903f3d7b97968b106aa8ea8')

package() {
  cd $srcdir/mecab-python-$pkgver
  python2 setup.py build || return 1
  python2 setup.py install --root=$pkgdir || return 1
}


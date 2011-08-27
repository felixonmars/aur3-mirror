# Contributor: Simon Lackerbauer <calypso@strpg.org> 
# Contributor: Tim Besard <tim dot besard at gmail dot com>
pkgname=mecab-python
pkgver=0.98
pkgrel=1
pkgdesc="Morphological Analysis Tool - Python interface"
arch=('i686' 'x86_64')
url="http://mecab.sourceforge.net/"
depends=("python" "mecab")
license=('BSD' 'LGPL' 'GPL')
source=(http://surfnet.dl.sourceforge.net/sourceforge/mecab//$pkgname-$pkgver.tar.gz)
md5sums=('c20ac4576190f219c6e07f2e52803f1e')

build() {
  cd $startdir/src/$pkgname-$pkgver
  python setup.py build || return 1
  mkdir $startdir/pkg/usr
  python setup.py install --prefix=$startdir/pkg/usr || return 1
}


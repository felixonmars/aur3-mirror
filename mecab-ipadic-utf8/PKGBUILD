# Maintainer: Hideyuki Tanaka <tanaka.hideyuki@gmail.com>
pkgname=mecab-ipadic-utf8
pkgver=2.7.0
pkgrel=1
epoch=
pkgdesc="Yet Another Japanese Dependency Structure Analyzer"
arch=('x86' 'x86_64')
url="http://code.google.com/p/mecab/"
license=('New BSD')
groups=()
depends=('mecab')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://mecab.googlecode.com/files/mecab-ipadic-2.7.0-20070801.tar.gz)
noextract=()
md5sums=('e09556657cc70e45564c6514a6b08495')

build() {
  cd "$srcdir/mecab-ipadic-2.7.0-20070801"
  ./configure --with-charset=utf8
}

check() {
  cd "$srcdir/mecab-ipadic-2.7.0-20070801"
  make
}

package() {
  cd "$srcdir/mecab-ipadic-2.7.0-20070801"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

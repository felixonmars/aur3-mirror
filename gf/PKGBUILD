# Contributor: Johannes Krampf <wuischke@amule.org>
pkgname=gf
pkgver=2.9
pkgrel=1
pkgdesc="The Grammatical Framework (=GF) is a grammar formalism based on type theory."
arch=('i686' 'x86_64')
url="http://www.cs.chalmers.se/~aarne/GF/"
license=('GPL')
makedepends=('ghc')
options=('!makeflags')
source=(http://www.cs.chalmers.se/~aarne/GF/download/GF-$pkgver.tgz)
md5sums=('0cbcd3de7835fbb3716699d817b130ec')

build() {
  cd $startdir/src/GF-$pkgver/src
  ./configure --prefix=/usr --enable-java=no
  make || return 1
  make bindir=$startdir/pkg/usr/bin datadir=$startdir/pkg/usr/share install-gf install-gfdoc install-lib 
}
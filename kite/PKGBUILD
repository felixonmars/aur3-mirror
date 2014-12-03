# Maintainer: 
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=kite
pkgver=0.2.0
pkgrel=1
pkgdesc="A minimalistic, easy to learn programming language with a small memory footprint"
arch=('i686' 'x86_64')
url="http://freecode.com/projects/kite/"
license=('BSD')
makedepends=('boost' 'llvm')
options=('!libtool')
install=$pkgname.install
source=(http://www.kite-language.org/files/$pkgname-llvm-$pkgver.tar.gz)
md5sums=('6523760b157f5bb8dee8edeb4bd33ee8')

build() {
  cd $pkgname-llvm-$pkgver

  ./configure --prefix=/usr
  make
}

package () {
  cd $pkgname-llvm-$pkgver

  make DESTDIR="${pkgdir}" install

  install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/$pkgname/COPYING
  rm -f "${pkgdir}"/usr/share/info/dir
}

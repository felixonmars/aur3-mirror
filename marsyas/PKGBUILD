# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: MeMi69 <MetalMilitia@gmx.net>

pkgname=marsyas
pkgver=0.4.8
pkgrel=1
license=('GPL')
arch=('i686' 'x86_64')
pkgdesc="(Music Analysis, Retrieval and Synthesis for Audio Signals) is an open source software framework for audio processing"
url="http://marsyas.sourceforge.net/"
makedepends=('cmake')
depends=('alsa-lib' 'gcc-libs')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver/src/"
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/src/"
  make DESTDIR="$pkgdir" install 
}
md5sums=('93f7be0fd0ff4201626f8c2f41abaaf0')

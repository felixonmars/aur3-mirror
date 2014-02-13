# Maintainer: 404
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: xdocopta

pkgname=treesize
pkgver=0.54.1
pkgrel=3
pkgdesc="A disk consumption analyzing tool, which sorts folders according to their physical occupied sizes"
url="http://treesize.sourceforge.net/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('glib2' 'gtk2' 'desktop-file-utils')
install=$pkgname.install
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver-src.tbz2")
sha256sums=('eb88841b4bb4e557be543107f396c50ecfdb0430324d753306d54bcaba20ef12')

build() {
  cd $pkgname-$pkgver

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
  install -Dm644 MarcosDiez-treeSize.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}

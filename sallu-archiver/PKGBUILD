# Maintainer: Your Name <frankendres@tuxfamily.org>
pkgname=sallu-archiver
pkgver=1.2.1
pkgrel=1
pkgdesc="A simple GTK (xdialog) frontend for archive creation and extraction"
arch=('i686' 'x86_64')
url="http://sallu.tuxfamily.org/"
license=('CeCILL')
depends=('xdialog' 'unrar' 'unzip' 'zip' 'p7zip')
source=(http://sallu.tuxfamily.org/IMG/bz2/$pkgname-$pkgver.tar.bz2)
md5sums=('62a7dd86ca1e426e65850252bf21624b')

build() {
  cd $pkgname-$pkgver
  #cmake . -DCMAKE_INSTALL_PREFIX=/usr
  #make
}

package() {
  cd "$pkgname-$pkgver"

  make PREFIX=/usr DESTDIR="$pkgdir/" install
  #mv -f "$pkgdir"/usr/doc "$pkgdir"/usr/share/
  install -Dm644 $srcdir/$pkgname-$pkgver/LICENSE-EN "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

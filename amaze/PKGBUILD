# Maintainer: Whitney Marshall <whitney.marshall@gmail.com>
pkgname=amaze
pkgver=0.2
pkgrel=1
pkgdesc="A Qt GUI downloader for .amz playlists from the Amazon MP3 store or cloud service"
arch=('i686' 'x86_64')
url="http://code.google.com/p/qtamaze"
license=('GPL3')
depends=('qt>=4' 'shared-mime-info')
install=amaze.install
source=(http://qtamaze.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('588c8bca95fa8226ef1ea6c3dc28d443')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  qmake PREFIX="/usr"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

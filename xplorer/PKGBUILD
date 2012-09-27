# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=xplorer
pkgver=0.10.0
pkgrel=1
pkgdesc="A filemanager for X-Windows with fast and accurate file type detection"
arch=(i686 x86_64)
url="http://cxplorer.sourceforge.net/"
license=('GPL')
depends=('libjpeg-turbo' 'libtiff' 'fontconfig' 'giflib' 'libxrender' 'libpng'
         'libintlize' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('libtool')
options=('!libtool')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/cxplorer/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz")
md5sums=('2427c5a792078f4862663ce47a94acb5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  # license
  install -Dm644 cxxx/COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

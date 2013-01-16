# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Christoph Zeiler <rabyte_gmail>

pkgname=quadra
pkgver=1.2.0
pkgrel=1
pkgdesc="A single/multiplayer action puzzle game reminiscent of Tetris"
arch=('i686' 'x86_64')
url="http://quadra.googlecode.com/"
license=('LGPL')
depends=('gcc-libs' 'libpng' 'libxpm' 'libxxf86vm')
makedepends=('bc')
source=(http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('df179970c4eb75af9ccdc5527d901fa6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --disable-version-check
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 Quadra.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim:set ts=2 sw=2 et:

# Contributor: Adrià Arrufat <swiftscythe@gmail.com>

pkgname=pidgin-mpris
pkgver=0.2.6
pkgrel=1
pkgdesc="This plugin will replace %now-playing in your status message with metadata from the currently playing song in a MPRIS compatible media player ."
arch=('i686' 'x86_64')
url="http://m0n5t3r.info/work/pidgin-mpris"
depends=('pidgin')
makedepends=()
source=(http://m0n5t3r.info/stuff/pidgin-mpris//$pkgname-$pkgver.tar.bz2)
license=('GPL')
md5sums=('fa985d8fd3f0081675a11bbe6b8b2be9')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./autogen.sh
  ./configure
  make || return 1
  make DESTDIR=$pkgdir install
}

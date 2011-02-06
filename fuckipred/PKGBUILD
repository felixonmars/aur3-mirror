# Contributor: sluggo <sluggo@dm9.se>

pkgname=fuckipred
pkgver=0.2.14b
pkgrel=2
pkgdesc="Front-end Using aircraCK-ng to Intelligently Penetrate Retardedly Encrypted Domains"
arch=('i686' 'x86_64')
url="http://www.dm9.se/fuckipred/"
license=('GPL2')
depends=('wireless_tools' 'gtk2' 'openssl' 'sqlite3')
makedepends=('gcc' 'gcc-libs' 'make' 'pkgconfig')
conflicts=('aircrack-ng')
install=fuckipred.install
source=(http://www.dm9.se/wp-content/files/$pkgname-$pkgver.tar.gz)
md5sums=('6076b366e4229c98729a8943e6852591')

build() {
  cd $srcdir/$pkgname-$pkgver
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}

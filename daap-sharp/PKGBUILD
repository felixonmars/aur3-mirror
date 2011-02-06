# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=daap-sharp
pkgver=0.3.5
pkgrel=2
pkgdesc="A library for consuming and publishing DAAP (Digital Audio Access Protocol) music shares"
arch=('i686' 'x86_64')
url="http://snorp.net/daap-sharp/"
license=('LGPL')
depends=('avahi' 'mono')
makedepends=('pkgconfig>=0.9')
source=(http://www.snorp.net/files/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('8ec7e4a45367b314a23fed09eea56eab')

build() {
  export MONO_SHARED_DIR=$(pwd)

  cd $pkgname-$pkgver

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

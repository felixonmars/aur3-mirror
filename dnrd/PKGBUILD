# Maintainer: Sabart Otto - Seberm <seberm@gmail.com>

pkgname=dnrd
pkgver=2.20.3
pkgrel=3
pkgdesc="Domain Name Relay Daemon is a caching, forwarding DNS proxy server."
arch=('i686' 'x86_64') 
url="http://dnrd.sourceforge.net"
license=('GPL')
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()

#source=(http://dl.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
source=("http://downloads.sourceforge.net/project/dnrd/dnrd/$pkgver/dnrd-${pkgver}.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fdnrd%2Ffiles%2Fdnrd%2F2.20.3%2Fdnrd-2.20.3.tar.gz%2Fdownload&ts=1291228511&use_mirror=switch")

install='dnrd.install'
md5sums=('41c9b070aae8ed403fc8c2aac7ab157c')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  mkdir -p $pkgdir/etc/dnrd
  chmod 755 $pkgdir/etc/dnrd
}

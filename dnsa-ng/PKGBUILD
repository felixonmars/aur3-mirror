pkgname=dnsa-ng
pkgver=0.6
pkgrel=1
pkgdesc="DNSA is a dns security swiss army knife"
arch=(i686 x86_64)
url="http://packetfactory.openwall.net/projects/dnsa/index.html"
license=('GPL')
depends=('libnet' 'libpcap')
groups=('archpwn' 'archpwn-spoofing')
source=(http://packetfactory.openwall.net/projects/$pkgname/$pkgname-current.tar.gz)
md5sums=('f047bd49b2fa182ecd3e77bd49ea75db')

build() {
  cd "$srcdir/dnsa-0.6-ng-beta1/sources"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}
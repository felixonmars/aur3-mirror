# Contributor: icarus <lysergic2 at comcast.net>
pkgname=dnsa
pkgver=0.5
pkgrel=1
pkgdesc="DNSA is a dns security swiss army knife"
arch=(i686 x86_64)
url="http://securitech.homeunix.org/dnsa/"
license=('GPL')
depends=('libnet' 'libpcap')
#cannot find a proper mirror so furced to use -current.tar.gz, email me one if you find it
source=(http://securitech.homeunix.org/$pkgname/$pkgname-current.tar.gz)
md5sums=('af7f29d576b041318aa04e67e2837a23') 

build() {
  cd "$startdir/src/$pkgname-$pkgver/sources"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$startdir/pkg" install
}

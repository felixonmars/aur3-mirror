# Contributor: Manolis Tzanidakis
# Maintainer: Vinilox <vinilox@vinilox.eu>


pkgname=adzapper
pkgver=20110915
pkgrel=5
pkgdesc="Ad Zapping With Squid"
arch=('any')
url="http://adzapper.sourceforge.net"
license=('BSD')
depends=('perl' 'squid' 'perl-perl4-corelibs')
optdepends=('squid: adzapper works with squid' 'polipo: you can use adzapper with polipo too, add line in config - redirector = /usr/bin/adzapper')

install=$pkgname.install
source=($url/scripts/squid_redirect adzapper.wrapper adzapper.conf bsd-license)

build() {
  cd $startdir/src/
  /usr/bin/install -D -m 755 squid_redirect \
      $startdir/pkg/usr/bin/adzapper
  /usr/bin/install -D -m 755 adzapper.wrapper \
      $startdir/pkg/usr/bin/adzapper.wrapper
  /usr/bin/install -D -m 644 adzapper.conf \
      $startdir/pkg/etc/adzapper/adzapper.conf
  /usr/bin/install -D -m 644 bsd-license \
      $startdir/pkg/usr/share/licenses/$pkgname/bsd-license
}

md5sums=('acbfce12b4d9c3a6103da73adfe612b3'
	'52663be9becbaebb8af1f70fd0084de8'
	'8f8b7ae87a99f266b43f0bea5db68e1b'
	'd69b948083a0b60b2a29b8c78842fb56')

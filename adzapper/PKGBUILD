# $Id: PKGBUILD 356 2008-04-18 22:56:27Z aaron $
# Maintainer: Peter Lobsinger <plobsing at gmail dot com>
# Maintainer: Travis Willard <travisw@wmpub.ca>
# Maintainer: eric <eric@archlinux.org>
# Contributor: Manolis Tzanidakis

pkgname=adzapper
pkgver=20090301
pkgrel=1
pkgdesc="Ad Zapping With Squid"
arch=('i686' 'x86_64')
url="http://adzapper.sourceforge.net"
license=('BSD')
depends=('perl')
optdepends=('squid: adzapper works with squid' 'polipo: you can use adzapper with polipo too, add line in config - redirector = /usr/bin/adzapper')

install=$pkgname.install
source=($url/adzap-$pkgver.tar.gz adzapper.wrapper adzapper.conf bsd-license)

build() {
  cd $startdir/src/adzap-$pkgver
  /bin/install -D -m 755 scripts/squid_redirect \
      $startdir/pkg/usr/bin/adzapper
  /bin/install -D -m 755 $startdir/src/adzapper.wrapper \
      $startdir/pkg/usr/bin/adzapper.wrapper
  /bin/install -D -m 644 $startdir/src/adzapper.conf \
      $startdir/pkg/etc/adzapper/adzapper.conf
  /bin/install -D -m 644 $startdir/src/bsd-license \
      $startdir/pkg/usr/share/licenses/$pkgname/bsd-license
}

md5sums=('f2a739e9703fa807292010a77abde3a4'
         '52663be9becbaebb8af1f70fd0084de8'
         '8f8b7ae87a99f266b43f0bea5db68e1b'
         'd69b948083a0b60b2a29b8c78842fb56')

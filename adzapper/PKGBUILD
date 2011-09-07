# $Id: PKGBUILD 356 2008-04-18 22:56:27Z aaron $
# Maintainer: Peter Lobsinger <plobsing at gmail dot com>
# Maintainer: Travis Willard <travisw@wmpub.ca>
# Maintainer: eric <eric@archlinux.org>
# Maintainer: Vinilox <vinilox@vinilox.eu>
# Contributor: Manolis Tzanidakis

pkgname=adzapper
pkgver=20110716
pkgrel=6
pkgdesc="Ad Zapping With Squid"
arch=('any')
url="http://adzapper.sourceforge.net"
license=('BSD')
depends=('perl')
optdepends=('squid: adzapper works with squid' 'polipo: you can use adzapper with polipo too, add line in config - redirector = /usr/bin/adzapper')

install=$pkgname.install
source=($url/scripts/squid_redirect adzapper.wrapper adzapper.conf bsd-license)

build() {
  cd $startdir/src/
  /bin/install -D -m 755 squid_redirect \
      $startdir/pkg/usr/bin/adzapper
  /bin/install -D -m 755 adzapper.wrapper \
      $startdir/pkg/usr/bin/adzapper.wrapper
  /bin/install -D -m 644 adzapper.conf \
      $startdir/pkg/etc/adzapper/adzapper.conf
  /bin/install -D -m 644 bsd-license \
      $startdir/pkg/usr/share/licenses/$pkgname/bsd-license
}

md5sums=('bd4040980b48a7096e388fdae0ba622a'
         '52663be9becbaebb8af1f70fd0084de8'
         '8f8b7ae87a99f266b43f0bea5db68e1b'
         'd69b948083a0b60b2a29b8c78842fb56')


# Maintainer: Aurelien Wailly <aurelien.wailly@gmail.com>
pkgname=sockstress
pkgver=0
pkgrel=1
pkgdesc="A program that is used to attack servers on the Internet and other networks utilizing TCP"
arch=('any')
url="http://h.ackack.net/sockstress.html"
license=('custom:unknown')
depends=('perl-libwww' 'perl-parallel-forkmanager' 'perl-net-pcaputils' 'perl-netpacket' 'perl-net-rawip')
provides=('sockstress' 'cannon' 'silverstress')
install="sockstress.install"
source=("http://downloads.ackack.net/sockstress.zip"
        "cannon.patch")

md5sums=('8a0b951edb23de32a34ed0f9ac2b9f86'
         'c3bf91882ea4d5b49629f3331ca2f091')

build() {
  patch -Np1 cannon.pl < cannon.patch
}

package() {
  install -m 755 -D sockstress.pl $pkgdir/usr/bin/sockstress.pl
  install -m 755 -D cannon.pl $pkgdir/usr/bin/cannon.pl
  install -m 755 -D silverstress.pl $pkgdir/usr/bin/silverstress.pl
}

# vim:set ts=2 sw=2 et:

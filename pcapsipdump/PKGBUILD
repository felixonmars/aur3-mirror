# Maintainer: TJ Vanderpoel <tj@rubyists.com>
pkgname=pcapsipdump
pkgver=0.1.4
pkgrel=1
pkgdesc="A packet capture utility for SIP traffic"
arch=(i386 x86_64)
url="http://sourceforge.net/projects/pcapsipdump/"
license=('GPL')
source=(elif_fix.patch http://downloads.sourceforge.net/project/pcapsipdump/pcapsipdump/0.1.4/pcapsipdump-0.1.4.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p0 < ../../elif_fix.patch
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m 0755 pcapsipdump "$pkgdir/usr/sbin/pcapsipdump"
  install -D -d -m 0755 "$pkgdir/usr/share/doc/pcapsipdump"
  install -D -m 0644 README.txt "$pkgdir/usr/share/doc/pcapsipdump/README.txt"
}

md5sums=('5ada2420b2dd4764b41af68b9cd12a91'
         '95ed26caf66237a654cae2cacdaa3386')
# vim:set ts=2 sw=2 et:

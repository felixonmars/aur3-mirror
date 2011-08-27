# Contributor: simo <simo@archlinux.org>
# Maintainer: Chris Brannon <cmbrannon (at) cox.net>

pkgname=pycmail
pkgver=0.1.4
pkgrel=2
pkgdesc="A simple mail sorter written in python"
url="http://melkor.dnp.fmph.uniba.sk/~garabik/pycmail.html"
license=("custom")
arch=('any')
depends=('python2')
source=("ftp://ftp.debian.org/debian/pool/main/p/pycmail/pycmail_$pkgver.tar.gz")
md5sums=('c6d1cb520dbab95261119503bd22df23')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i -e 's|^#! /usr/bin/python$|#!/usr/bin/python2|' pycmail
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 pycmail "$pkgdir/usr/bin/pycmail"
  install -D -m644 pycmail.1 "$pkgdir/usr/share/man/man1/pycmail.1"
  install -D -m644 pycmailrc "$pkgdir/etc/pycmailrc.sample"
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/pycmail/COPYING"
}

# Maintainer: Mikael Eriksson <mikael_eriksson@miffe.org>

pkgname=googlecl
pkgver=0.9.14
pkgrel=1
pkgdesc="Command line tools for the Google Data APIs"
arch=('any')
url="http://code.google.com/p/googlecl/"
license=('APACHE')
depends=('python2-gdata')
source=(http://googlecl.googlecode.com/files/googlecl-$pkgver.tar.gz)
md5sums=('35d8fde3034d2ff8175385e5f5d7aa08')

build() {
  cd "$srcdir/googlecl-$pkgver"

  sed -i '1c#!/usr/bin/python2' src/google

  python2 setup.py install --prefix=/usr --root=$pkgdir

  install -Dm644 man/google.1 "${pkgdir}/usr/share/man/man1/google.1"
}

# vim:set ts=2 sw=2 et:

# Maintainer: Antonio Bonifati - ant at venus deis unical it
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>
# $Id$

pkgname=openvrml
pkgver=0.17.10
pkgrel=2
pkgdesc="A program and library to read and display VRML97 and X3D files."
arch=('i386' 'x86_64')
url="http://www.openvrml.org/"
license=('LGPL3')
depends=('boost' 'curl' 'libgnomeui' 'mesa')
options=(!libtool)
source=(http://downloads.sourceforge.net/openvrml/$pkgname-$pkgver.tar.gz)
md5sums=('0f342cd1d78bfc7c12e4cebd0909e159')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --disable-mozilla-plugin \
    --disable-script-node-javascript BOOST_LIB_SUFFIX=-mt
  make || return 1
  make DESTDIR="$pkgdir/" install

  mv "$pkgdir/usr/include/openvrml/openvrml/"* "$pkgdir/usr/include/openvrml"
  rmdir "$pkgdir/usr/include/openvrml/openvrml"
  rm -rf "$pkgdir/usr/lib/mozilla"
}

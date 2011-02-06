# Contributor: Alessio Biancalana <dottorblaster@gmail.com>

pkgname=libmimic
pkgver=1.0.4
pkgrel=4
pkgdesc="An open source video encoding/decoding library for Mimic V2.x"
arch=('i686' 'x86_64')
url="http://farsight.sourceforge.net"
options=('!libtool')
license=('LGPL')
depends=('glibc')
source=(http://downloads.sourceforge.net/sourceforge/farsight/libmimic-$pkgver.tar.gz)
md5sums=('94f0dbb1d3c253201553a4069555fb84')

build() {
  cd $srcdir/libmimic-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}


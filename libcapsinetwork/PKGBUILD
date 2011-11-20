# Maintainer: Tasos Latsas <tlatsas2000@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Kritoke <kritoke@gamebox.net>
# Contributor: damir <damir@archlinux.org>

pkgname=libcapsinetwork
pkgver=0.3.0
pkgrel=2
pkgdesc="A network library for C++ server daemons aimed at easy development of server daemons."
arch=('i686' 'x86_64')
url="http://www.robertjohnkaper.com/software/atlantik/download.html"
license=('GPL')
depends=('gcc-libs')
options=('!libtool' '!makeflags')
source=(gcc4.3.patch \
  http://ftp.de.debian.org/debian/pool/main/libc/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz)
md5sums=('a82db90a413565bc87c64db3580c8c86' '9e6e221fdd1ec53c518b2ca61830e8cf')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -Np1 -i "$srcdir/gcc4.3.patch"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
}

# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Changes: Chris Osgood <archlinux at functionalfuture dot com>

pkgname=lib32-libzip
pkgver=0.11.1
pkgrel=1
pkgdesc="A C library for reading, creating, and modifying zip archives (32-bit)"
url="http://www.nih.at/libzip/index.html"
license=('BSD')
groups=('lib32')
arch=('x86_64')
depends=('libzip' 'lib32-zlib' 'lib32-glibc')
options=('!libtool')
source=("http://www.nih.at/libzip/libzip-${pkgver}.tar.xz")
md5sums=('87d5ec3629f6ad2a4b01ad961e7f0c19')

build() {
  cd "${srcdir}/libzip-${pkgver}"

  CC='gcc -m32' CFLAGS='-D_FILE_OFFSET_BITS=64 -O2' ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/libzip-${pkgver}"
  make DESTDIR=${pkgdir} install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}

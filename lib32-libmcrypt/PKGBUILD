# Maintainer: PyroPeter <googlemail.com@abi1789>

# Adapted from extra/libmcrypt, credits:
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=lib32-libmcrypt
pkgver=2.5.8
pkgrel=1
pkgdesc="A library which provides a uniform interface to several symmetric encryption algorithms"
url="http://mcrypt.sourceforge.net/"
arch=(x86_64)
license=('GPL')
makedepends=('gcc-multilib')
depends=('libmcrypt' 'lib32-glibc')
options=('!libtool')
source=(http://downloads.sourceforge.net/mcrypt/libmcrypt-${pkgver}.tar.bz2)
md5sums=('c4f491dd411a09e9de3b8702ea6f73eb')

build() {
  cd ${srcdir}/libmcrypt-${pkgver}

  export CC="gcc -m32"
  export CXX="g++ -m32"
  ./configure --prefix=/usr --libdir=/usr/lib32 --mandir=/usr/share/man
  make
}

package() {
  cd ${srcdir}/libmcrypt-${pkgver}

  make DESTDIR=${pkgdir} install
  rm -r "$pkgdir"/usr/{bin,share,include}
}

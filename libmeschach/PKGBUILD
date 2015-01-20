# Maintainer:  Colin Woodbury <colingw@gmail.com>
# Contributor: Daenyth <Daenyth [at] gmail [dot] com>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: sh__

pkgname=libmeschach
pkgver=1.2b
_debianrelease=13
pkgrel=5
pkgdesc="C-language library of routines for performing matrix computations"
arch=('i686' 'x86_64')
url="http://www.cs.uiowa.edu/~dstewart/meschach/"
license=('GPL')
depends=()
source=(http://ftp.de.debian.org/debian/pool/main/m/meschach/meschach_${pkgver}.orig.tar.gz
	http://ftp.de.debian.org/debian/pool/main/m/meschach/meschach_${pkgver}-${_debianrelease}.diff.gz)
md5sums=('faf05a52c1a8a44a5716c6a2d681999f'
         'bdc7289be71d235afc92b5707f6732d2')

build() {
  cd "$srcdir/meschach-${pkgver}"

  patch -p1 -i ../meschach_${pkgver}-${_debianrelease}.diff 
  ./configure --with-all
  CFLAGS="${CFLAGS} -fPIC" make all || return 1
}

package() {
  cd "$srcdir/meschach-${pkgver}"

  install -d ${pkgdir}/usr/lib/
  cp libmeschach.so ${pkgdir}/usr/lib/libmeschach.so
  ln -sf /usr/lib/libmeschach.so ${pkgdir}/usr/lib/libmeschach.so.1.2
  install -d ${pkgdir}/usr/include/meschach
  cp *.h ${pkgdir}/usr/include/meschach
}

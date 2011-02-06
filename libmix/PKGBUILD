# Contributor: ice-man <icemanf@gmail.com>
pkgname=libmix
pkgver=2.05
pkgrel="1" 
pkgdesc="Programs Crypto/Network/Multipurpose Library"
provides=libmix
makedepends=('gcc' 'make')
depends=()
source=(http://mixter.void.ru/${pkgname}-${pkgver/.}.tgz)
url="http://mixter.void.ru/"
md5sums=('9b2b6dafbbea83aec9d272534a2fdb34')
arch=('i686')
license="GPL-2"

build() {
  cd $startdir/src/$pkgname-v$pkgver
  sed -i "s:-O3 -funroll-loops:${CFLAGS} -fPIC:" configure
  ./configure --with-no-net2 --with-libraries-as-cpp
  make || return 1
  make\
        INSTALL_INCLUDES_IN="$startdir"/pkg/usr/include\
        INSTALL_LIBRARY_IN="$startdir"/pkg/usr/lib\
        INSTALL_MANPAGE_IN="$startdir"/pkg/usr/man \
        install || return 1

}

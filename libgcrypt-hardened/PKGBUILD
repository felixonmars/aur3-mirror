#

pkgname=libgcrypt-hardened
pkgver=1.4.6
pkgrel=3
pkgdesc="a general purpose crypto library based on the code used"
arch=(i686 x86_64)
url="http://www.gnupg.org"
license=('LGPL')
depends=('libgpg-error>=1.9')
options=('!libtool' '!emptydirs')
install=libgcrypt.install
source=(ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-${pkgver}.tar.bz2
	#ftp://ftp.franken.de/pub/crypt/mirror/ftp.gnupg.org/gcrypt/libgcrypt/${pkgname}-${pkgver}.tar.bz2
)
provides=('libgcrypt=1.4.6-3')
replaces=('libgcrypt<=1.4.6-3')
conflicts=('libcrypt=>1.4.6-3')

md5sums=('dbf99425a4fe9217c84ce3a35d938634')

build() {
  pkgname="libgcrypt"
  export CFLAGS="${CFLAGS} -D_FORTIFY_SOURCE=2 -fstack-protector --param ssp-buffer-size=4"
  export LDFLAGS="${LDFLAGS} -Wl,-z,relro -Wl,-z,now"
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
	--disable-static \
	--disable-padlock-support
  make
}

check() {
  pkgname="libgcrypt"
  cd ${srcdir}/${pkgname}-${pkgver}
  make check
}

package() {
  pkgname="libgcrypt"
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install

  # Move dynamic libraries to /lib
  install -d -m755 "${pkgdir}"/lib/
  mv "${pkgdir}"/usr/lib/libgcrypt.so* "${pkgdir}"/lib/
  ln -sf /lib/libgcrypt.so "${pkgdir}"/usr/lib/libgcrypt.so
pkgname="libgcrypt-hardened"
}

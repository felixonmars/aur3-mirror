# Maintainer: Wade C <archwade.20.apex3@xoxy.net>
pkgname=lftp-gnutls-prio
pkgver=4.4.0
pkgrel=1
pkgdesc="Sophisticated command line based FTP client"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gcc-libs' 'readline>=6.2' "gnutls" "expat>=2.0.1-4" 'sh')
optdepends=('perl: needed for convert-netscape-cookies and verify-file')
url="http://lftp.yar.ru/"
backup=('etc/lftp.conf')
conflicts=('lftp')
source=(http://ftp.yars.free.net/pub/source/lftp/lftp-${pkgver}.tar.bz2
       lftp-4.3.8-gets.patch
       lftp-4.3.8-ssl-priority.patch)
md5sums=('9d6a048bb6be9bc3baecfea53b0d8330'
         '77168a7f368b07eec7e079b55496fa97'
         'e063b4f2fc9532932d2a5c9daf30b3b5')

build() {
  cd ${srcdir}/lftp-${pkgver}
  patch -Np1 -i ${srcdir}/lftp-4.3.8-gets.patch
  patch -Np1 -i ${srcdir}/lftp-4.3.8-ssl-priority.patch
  ./configure --prefix=/usr --with-gnutls \
	--without-openssl --disable-static
  make
}

package() {
  cd ${srcdir}/lftp-${pkgver}
  make DESTDIR=${pkgdir} install
  rm -rf ${pkgdir}/usr/lib
}

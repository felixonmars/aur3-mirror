# Contributor: Eric Le Bras <eric.lebras@gmail.com>

pkgname=cnijfilter-common320
pkgver=3.20
pkgrel=1
pkgdesc="Canon IJ Printer Driver (Common package for driver version 3.20)"
url="http://support-my.canon-asia.com/contents/MY/EN/0100236703.html"
arch=('i686' 'x86_64')
license=('custom')
if [ "${CARCH}" = 'x86_64' ]; then
  depends=('lib32-libcups' 'lib32-popt')
elif [ "${CARCH}" = 'i686' ]; then
  depends=('libcups' 'popt')
fi
makedepends=('rpmextract' 'gtk2' 'autoconf>=2.59' 'automake>=1.9.5')
conflicts=('cnijfilter-common270' 'cnijfilter-common')
install=cnijfilter-common320.install
source=(http://gdlp01.c-wss.com/gds/7/0100002367/01/cnijfilter-source-3.20-1.tar.gz)
md5sums=('0a40b46016511d59d1d0a3d3d9a653dd')

build() {
  cd ${srcdir}/cnijfilter-source-3.20-1

  cd libs
  ./autogen.sh --prefix=/usr || return 1
  make install DESTDIR=${pkgdir} || return 1
  cd ../cngpij
  ./autogen.sh --prefix=/usr --enable-progpath=/usr/bin || return 1
  make install DESTDIR=${pkgdir} || return 1
  cd ../pstocanonij
  ./autogen.sh --prefix=/usr --enable-progpath=/usr/bin || return 1
  make install DESTDIR=${pkgdir} || return 1
  cd ../backend
  ./autogen.sh --prefix=/usr || return 1
  make install DESTDIR=${pkgdir} || return 1
  cd ../backendnet
  ./autogen.sh --prefix=/usr --enable-progpath=/usr/bin || return 1
  make install DESTDIR=${pkgdir} || return 1
  cd ../lgmon
  ./autogen.sh --prefix=/usr --enable-progpath=/usr/bin || return 1
  make
  cd ../cngpijmon/cnijnpr
  ./autogen.sh --prefix=/usr || return 1
  make install DESTDIR=${pkgdir} || return 1
  cd ../..

  mkdir -p ${pkgdir}/usr/lib/bjlib
  install -c -m 644 com/ini/cnnet.ini ${pkgdir}/usr/lib/bjlib
  install -c -s -m 755 com/libs_bin/libcnnet.so.1.1.0 ${pkgdir}/usr/lib
  cd ${pkgdir}/usr/lib
  ln -s libcnnet.so.1.1.0 libcnnet.so
  cd -

  install -D LICENSE-cnijfilter-${pkgver}EN.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cnijfilter-${pkgver}EN.txt
  install -D LICENSE-cnijfilter-${pkgver}FR.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cnijfilter-${pkgver}FR.txt
  install -D LICENSE-cnijfilter-${pkgver}JP.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cnijfilter-${pkgver}JP.txt
  install -D LICENSE-cnijfilter-${pkgver}SC.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cnijfilter-${pkgver}SC.txt
}

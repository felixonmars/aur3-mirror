# Contributor: Eric Le Bras <eric.lebras@gmail.com>

pkgname=cnijfilter-ip4700series
pkgver=3.20
pkgrel=2
pkgdesc="Canon IJ Printer Driver for Pixma IP4700 series Inkjet Printers"
url="http://support-my.canon-asia.com/contents/MY/EN/0100236703.html"
arch=('i686' 'x86_64')
license=('custom')
depends=('cnijfilter-common320' 'gtk2>=2.6' 'popt>=1.4')
makedepends=('rpmextract' 'autoconf>=2.59' 'automake>=1.9.5')
install=cnijfilter-ip4700.install
source=(http://gdlp01.c-wss.com/gds/7/0100002367/01/cnijfilter-source-3.20-1.tar.gz
	cnijfilter-ip4700series.patch)
md5sums=('0a40b46016511d59d1d0a3d3d9a653dd'
         '99f4b9f44edd2a71e184b8498d1b864c')

build() {
  cd ${srcdir}/cnijfilter-source-3.20-1
  patch -p1 -i ../cnijfilter-ip4700series.patch

  cd ppd
  ./autogen.sh --prefix=/usr --program-suffix=ip4700 || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ../cnijfilter
  ./autogen.sh --prefix=/usr --program-suffix=ip4700 --enable-libpath=/usr/lib/bjlib --enable-binpath=/usr/bin || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ../printui
  ./autogen.sh --prefix=/usr --program-suffix=ip4700 || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ../lgmon
  ./autogen.sh --prefix=/usr --program-suffix=ip4700 --enable-progpath=/usr/bin || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ../cngpijmon
  ./autogen.sh --prefix=/usr --program-suffix=ip4700 || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ..
  install -d ${pkgdir}/usr/lib/bjlib
  install -m 755 361/database/* ${pkgdir}/usr/lib/bjlib
  install -s -m 755 361/libs_bin/*.so.* ${pkgdir}/usr/lib

  rm -rf ${pkgdir}/usr/lib/cups/
  rm -f ${pkgdir}/usr/share/cups/model/canonmp*

  install -D LICENSE-cnijfilter-${pkgver}EN.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cnijfilter-${pkgver}EN.txt
  install -D LICENSE-cnijfilter-${pkgver}FR.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cnijfilter-${pkgver}FR.txt
  install -D LICENSE-cnijfilter-${pkgver}JP.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cnijfilter-${pkgver}JP.txt
  install -D LICENSE-cnijfilter-${pkgver}SC.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cnijfilter-${pkgver}SC.txt
}

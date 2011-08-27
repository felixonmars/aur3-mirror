# Contributor: Gary Ayre <catchfire@gmail.com>
# PKGBUILD based on: Eric Le Bras <eric.lebras@gmail.com>

pkgname=cnijfilter-mx320
pkgver=3.10
pkgrel=2
pkgdesc="Canon IJ Printer Driver for Pixma MX320 multifunction"
arch=('i686')
url="http://support-au.canon.com.au/contents/AU/EN/0100188102.html"
license=('GPL2' 'LGPL2' 'custom')
depends=('libglade' 'cups' 'ghostscript')
makedepends=('autoconf>=2.13' 'automake>=1.6' 'tar' 'make' 'gcc')
conflicts=('cnijfilter-common')
install=cnijfilter-mx320.install
source=("http://gdlp01.c-wss.com/gds/1/0100001881/01/cnijfilter-source-${pkgver}-1.tar.gz" "id.po.patch")
md5sums=('e4484a6a915c0aa18e5d7dcb35391f88' '6c46a61a5c3cebfd7118fad58c4e70e9')

build() {
  cd ${srcdir}
  tar xzf cnijfilter-source-${pkgver}-1.tar.gz

  patch -Np1 -i $startdir/src/id.po.patch || return 1

  cd ${srcdir}/cnijfilter-source-${pkgver}/backend
  ./autogen.sh --prefix=/usr --program-suffix=mx320 --enable-progpath=/usr/bin || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-source-${pkgver}/libs
  ./autogen.sh --prefix=/usr --program-suffix=mx320 || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-source-${pkgver}/pstocanonij
  ./autogen.sh --prefix=/usr --program-suffix=mx320 --enable-binpath=/usr/bin --enable-progpath=/usr/bin || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-source-${pkgver}/cngpij
  ./autogen.sh --prefix=/usr --program-suffix=mx320 --enable-binpath=/usr/bin --enable-progpath=/usr/bin || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-source-${pkgver}/ppd
  ./autogen.sh --prefix=/usr --program-suffix=mx320 || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-source-${pkgver}/cnijfilter
  ./autogen.sh --prefix=/usr --program-suffix=mx320 --enable-libpath=/usr/lib/bjlib --enable-binpath=/usr/bin --enable-progpath=/usr/bin || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-source-${pkgver}/printui
  ./autogen.sh --prefix=/usr --program-suffix=mx320 --datadir=/usr/share --enable-progpath=/usr/bin || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-source-${pkgver}/lgmon
  ./autogen.sh --prefix=/usr --program-suffix=mx320 --enable-binpath=/usr/bin --enable-progpath=/usr/bin || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-source-${pkgver}/cngpijmon
  ./autogen.sh --prefix=/usr --program-suffix=mx320 --enable-progpath=/usr/bin || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-source-${pkgver}
  install -d ${pkgdir}/usr/lib/bjlib
  install -m 755 348/database/* ${pkgdir}/usr/lib/bjlib
  install -s -m 755 348/libs_bin/*.so.* ${pkgdir}/usr/lib
  install -D LICENSE-cnijfilter-${pkgver}EN.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cnijfilter-${pkgver}EN.txt
  ln -s /usr/lib/cups/filter/pstocanonijmx320 ${pkgdir}/usr/lib/cups/filter/pstocanonij
  chown -R root:root ${pkgdir}/usr/

}

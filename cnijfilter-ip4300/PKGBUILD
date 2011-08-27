# Contributor: Eric Le Bras <eric.lebras@gmail.com>

pkgname=cnijfilter-ip4300
pkgver=2.70
pkgrel=1
pkgdesc="Canon IJ Printer Driver for Pixma IP4300 multifunction"
arch=('i686')
url="http://support-au.canon.com.au/contents/AU/EN/0100084103.html"
license=('GPL2' 'LGPL2' 'custom')
depends=('cnijfilter-common270' 'gtk' 'libxml' 'libglade')
makedepends=('rpmextract autoconf>=2.13' 'automake>=1.6' 'tar' 'make' 'gcc')
install=cnijfilter-ip4300.install
source=("http://gdlp01.c-wss.com/gds/5/0900007185/02/cnijfilter-common-${pkgver}-2.src.rpm"
	cngpijmonip4300.desktop
	printuiip4300.desktop)
md5sums=('478aa71f6f4c81ef788d2136152af4c3'
         '20974ab44bf9779649a63389da198de4'
         'b4bd4fbf1dbcc38ca9ad1fdcbb69154e')

build() {
  cd ${srcdir}
  rpmextract.sh cnijfilter-common-${pkgver}-2.src.rpm
  tar xzf cnijfilter-common-${pkgver}-2.tar.gz

  cd ${srcdir}/cnijfilter-common-${pkgver}/ppd
  ./autogen.sh --prefix=/usr || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-common-${pkgver}/cnijfilter
  ./autogen.sh --prefix=/usr --program-suffix=ip4300 --enable-libpath=/usr/lib/bjlib --enable-binpath=/usr/bin || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-common-${pkgver}/printui
  ./autogen.sh --prefix=/usr --program-suffix=ip4300 --datadir=/usr/share || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-common-${pkgver}/lgmon
  ./autogen.sh --prefix=/usr --program-suffix=ip4300 --enable-progpath=/usr/bin || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-common-${pkgver}/cngpijmon
  ./autogen.sh --prefix=/usr --program-suffix=ip4300 || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-common-${pkgver}
  install -d ${pkgdir}/usr/lib/bjlib
  install -m 755 294/database/* ${pkgdir}/usr/lib/bjlib
  install -s -m 755 294/libs_bin/*.so.* ${pkgdir}/usr/lib
  install -D LICENSE-cnijfilter-${pkgver}E.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cnijfilter-${pkgver}E.txt

  install -Dm644 "$srcdir/cngpijmonip4300.desktop" "$pkgdir/usr/share/applications/cngpijmonip4300.desktop"
  install -Dm644 "$srcdir/printuiip4300.desktop" "$pkgdir/usr/share/applications/printuiip4300.desktop"

  rm -rf ${pkgdir}/usr/lib/cups/
  rm ${pkgdir}/usr/share/cups/model/canonip{3300,2500,1800,90}
  rm ${pkgdir}/usr/share/cups/model/canonmp*.ppd
}

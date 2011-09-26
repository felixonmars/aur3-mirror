# Contributor: Eric Le Bras <eric.lebras@gmail.com>

pkgname=cnijfilter-mp600
pkgver=2.70
pkgrel=2
pkgdesc="Canon IJ Printer Driver for Pixma MP600 multifunction"
arch=('i686')
url="http://support-au.canon.com.au/contents/AU/EN/0900718516.html"
license=('GPL2' 'LGPL2' 'custom')
depends=('cnijfilter-common270' 'gtk' 'libxml' 'libglade')
makedepends=('rpmextract autoconf>=2.13' 'automake>=1.6' 'tar' 'make' 'gcc')
install=cnijfilter-mp600.install
source=("http://gdlp01.c-wss.com/gds/5/0900007185/02/cnijfilter-common-${pkgver}-2.src.rpm"
	cngpijmonmp600.desktop
	printuimp600.desktop
	ppd_file_t.patch)
md5sums=('478aa71f6f4c81ef788d2136152af4c3'
         '5e6cbafdf157d5b9b1eaaa9f10625fc7'
         '8c9074dd7a78e1394e741269069374cd'
         '23133ab84bdf55e591ad9e5c91ff3ee3')
build() {
  cd ${srcdir}
  rpmextract.sh cnijfilter-common-${pkgver}-2.src.rpm
  tar xzf cnijfilter-common-${pkgver}-2.tar.gz

  patch -p0 < ppd_file_t.patch

  cd ${srcdir}/cnijfilter-common-${pkgver}/ppd
  ./autogen.sh --prefix=/usr || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-common-${pkgver}/cnijfilter
  ./autogen.sh --prefix=/usr --program-suffix=mp600 --enable-libpath=/usr/lib/bjlib --enable-binpath=/usr/bin || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-common-${pkgver}/printui
  ./autogen.sh --prefix=/usr --program-suffix=mp600 --datadir=/usr/share || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-common-${pkgver}/lgmon
  ./autogen.sh --prefix=/usr --program-suffix=mp600 --enable-progpath=/usr/bin || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-common-${pkgver}/cngpijmon
  ./autogen.sh --prefix=/usr --program-suffix=mp600 || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-common-${pkgver}
  install -d ${pkgdir}/usr/lib/bjlib
  install -m 755 295/database/* ${pkgdir}/usr/lib/bjlib
  install -s -m 755 295/libs_bin/*.so.* ${pkgdir}/usr/lib
  install -D LICENSE-cnijfilter-${pkgver}E.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cnijfilter-${pkgver}E.txt

  install -Dm644 "$srcdir/cngpijmonmp600.desktop" "$pkgdir/usr/share/applications/cngpijmonmp600.desktop"
  install -Dm644 "$srcdir/printuimp600.desktop" "$pkgdir/usr/share/applications/printuimp600.desktop"

  rm -rf ${pkgdir}/usr/lib/cups/
  rm ${pkgdir}/usr/share/cups/model/canonip*
  rm ${pkgdir}/usr/share/cups/model/canonmp{160,510}.ppd
}

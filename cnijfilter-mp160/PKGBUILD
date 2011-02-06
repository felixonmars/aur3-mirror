# Contributor: Eric Le Bras <eric.lebras@gmail.com>

pkgname=cnijfilter-mp160
pkgver=2.70
pkgrel=1
pkgdesc="Canon IJ Printer Driver for Pixma MP160 multifunction"
arch=('i686')
url="http://support-au.canon.com.au/contents/AU/EN/0900718516.html"
license=('GPL2' 'LGPL2' 'custom')
depends=('cnijfilter-common270' 'gtk' 'libxml' 'libglade')
makedepends=('rpmextract autoconf>=2.13' 'automake>=1.6' 'tar' 'make' 'gcc')
install=cnijfilter-mp160.install
source=("http://gdlp01.c-wss.com/gds/5/0900007185/02/cnijfilter-common-${pkgver}-2.src.rpm"
	cngpijmonmp160.desktop
	printuimp160.desktop)
md5sums=('478aa71f6f4c81ef788d2136152af4c3'
         '38d599011281e59cf584c53a23d5bb1a'
         'b108a6c484fab163125027517698f68a')

build() {
  cd ${srcdir}
  rpmextract.sh cnijfilter-common-${pkgver}-2.src.rpm
  tar xzf cnijfilter-common-${pkgver}-2.tar.gz

  cd ${srcdir}/cnijfilter-common-${pkgver}/ppd
  ./autogen.sh --prefix=/usr || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-common-${pkgver}/cnijfilter
  ./autogen.sh --prefix=/usr --program-suffix=mp160 --enable-libpath=/usr/lib/bjlib --enable-binpath=/usr/bin || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-common-${pkgver}/printui
  ./autogen.sh --prefix=/usr --program-suffix=mp160 --datadir=/usr/share || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-common-${pkgver}/lgmon
  ./autogen.sh --prefix=/usr --program-suffix=mp160 --enable-progpath=/usr/bin || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-common-${pkgver}/cngpijmon
  ./autogen.sh --prefix=/usr --program-suffix=mp160 || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-common-${pkgver}
  install -d ${pkgdir}/usr/lib/bjlib
  install -m 755 291/database/* ${pkgdir}/usr/lib/bjlib
  install -s -m 755 291/libs_bin/*.so.* ${pkgdir}/usr/lib
  install -D LICENSE-cnijfilter-${pkgver}E.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cnijfilter-${pkgver}E.txt

  install -Dm644 "$srcdir/cngpijmonmp160.desktop" "$pkgdir/usr/share/applications/cngpijmonmp160.desktop"
  install -Dm644 "$srcdir/printuimp160.desktop" "$pkgdir/usr/share/applications/printuimp160.desktop"

  rm -rf ${pkgdir}/usr/lib/cups/
  rm ${pkgdir}/usr/share/cups/model/canonip*
  rm ${pkgdir}/usr/share/cups/model/canonmp{510,600}.ppd
}

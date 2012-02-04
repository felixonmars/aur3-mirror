# Contributor: Eric Le Bras <eric.lebras@gmail.com>

pkgname=cnijfilter-ip1800series
pkgver=2.70
pkgrel=1
pkgdesc="Canon IJ Printer Driver for Pixma IP1800 series multifunction"
arch=('i686')
url="http://support-au.canon.com.au/contents/AU/EN/0900718516.html"
license=('GPL2' 'LGPL2' 'custom')
depends=('cnijfilter-common270' 'gtk' 'libxml' 'libglade')
makedepends=('rpmextract autoconf>=2.13' 'automake>=1.6' 'tar' 'make' 'gcc')
install=cnijfilter-ip1800series.install
source=("http://gdlp01.c-wss.com/gds/5/0900007185/02/cnijfilter-common-${pkgver}-2.src.rpm"
	cngpijmonip1800series.desktop
	printuiip1800series.desktop)
md5sums=('478aa71f6f4c81ef788d2136152af4c3'
         '0531790082c6e0dda3f9eaf8263ba402'
         '69be069048ce3e9013b6197114dd370f')

build() {
  cd ${srcdir}
  rpmextract.sh cnijfilter-common-${pkgver}-2.src.rpm
  tar xzf cnijfilter-common-${pkgver}-2.tar.gz

  cd ${srcdir}/cnijfilter-common-${pkgver}/ppd
  ./autogen.sh --prefix=/usr || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-common-${pkgver}/cnijfilter
  ./autogen.sh --prefix=/usr --program-suffix=ip1800 --enable-libpath=/usr/lib/bjlib --enable-binpath=/usr/bin || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-common-${pkgver}/printui
  ./autogen.sh --prefix=/usr --program-suffix=ip1800 --datadir=/usr/share || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-common-${pkgver}/lgmon
  ./autogen.sh --prefix=/usr --program-suffix=ip1800 --enable-progpath=/usr/bin || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-common-${pkgver}/cngpijmon
  ./autogen.sh --prefix=/usr --program-suffix=ip1800 || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-common-${pkgver}
  install -d ${pkgdir}/usr/lib/bjlib
  install -m 755 312/database/* ${pkgdir}/usr/lib/bjlib
  install -s -m 755 312/libs_bin/*.so.* ${pkgdir}/usr/lib
  install -D LICENSE-cnijfilter-${pkgver}E.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cnijfilter-${pkgver}E.txt

  install -Dm644 "$srcdir/cngpijmonip1800.desktop" "$pkgdir/usr/share/applications/cngpijmonip1800.desktop"
  install -Dm644 "$srcdir/printuiip1800.desktop" "$pkgdir/usr/share/applications/printuiip1800.desktop"

  rm -rf ${pkgdir}/usr/lib/cups/
  rm ${pkgdir}/usr/share/cups/model/canonip{3300,4300,2500,90}
  rm ${pkgdir}/usr/share/cups/model/canonmp*.ppd
}

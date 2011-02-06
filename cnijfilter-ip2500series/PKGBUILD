# Contributor: Eric Le Bras <eric.lebras@gmail.com>

pkgname=cnijfilter-ip2500series
pkgver=2.70
pkgrel=1
pkgdesc="Canon IJ Printer Driver for Pixma IP2500 series multifunction"
arch=('i686')
url="http://support-au.canon.com.au/contents/AU/EN/0900718516.html"
license=('GPL2' 'LGPL2' 'custom')
depends=('cnijfilter-common270' 'gtk' 'libxml' 'libglade')
makedepends=('rpmextract autoconf>=2.13' 'automake>=1.6' 'tar' 'make' 'gcc')
install=cnijfilter-ip2500series.install
source=("http://gdlp01.c-wss.com/gds/5/0900007185/02/cnijfilter-common-${pkgver}-2.src.rpm"
	cngpijmonip2500series.desktop
	printuiip2500series.desktop)
md5sums=('478aa71f6f4c81ef788d2136152af4c3'
         'dfc920bc6654e6102123c27d591e873d'
         'f24b1ad52b3255a57b9471c206fbc781')

build() {
  cd ${srcdir}
  rpmextract.sh cnijfilter-common-${pkgver}-2.src.rpm
  tar xzf cnijfilter-common-${pkgver}-2.tar.gz

  cd ${srcdir}/cnijfilter-common-${pkgver}/ppd
  ./autogen.sh --prefix=/usr || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-common-${pkgver}/cnijfilter
  ./autogen.sh --prefix=/usr --program-suffix=ip2500 --enable-libpath=/usr/lib/bjlib --enable-binpath=/usr/bin || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-common-${pkgver}/printui
  ./autogen.sh --prefix=/usr --program-suffix=ip2500 --datadir=/usr/share || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-common-${pkgver}/lgmon
  ./autogen.sh --prefix=/usr --program-suffix=ip2500 --enable-progpath=/usr/bin || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-common-${pkgver}/cngpijmon
  ./autogen.sh --prefix=/usr --program-suffix=ip2500 || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-common-${pkgver}
  install -d ${pkgdir}/usr/lib/bjlib
  install -m 755 311/database/* ${pkgdir}/usr/lib/bjlib
  install -s -m 755 311/libs_bin/*.so.* ${pkgdir}/usr/lib
  install -D LICENSE-cnijfilter-${pkgver}E.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cnijfilter-${pkgver}E.txt

  install -Dm644 "$srcdir/cngpijmonip2500.desktop" "$pkgdir/usr/share/applications/cngpijmonip2500.desktop"
  install -Dm644 "$srcdir/printuiip2500.desktop" "$pkgdir/usr/share/applications/printuiip2500.desktop"

  rm -rf ${pkgdir}/usr/lib/cups/
  rm ${pkgdir}/usr/share/cups/model/canonip{3300,4300,1800,90}
  rm ${pkgdir}/usr/share/cups/model/canonmp*.ppd
}

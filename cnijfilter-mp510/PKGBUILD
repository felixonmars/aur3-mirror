# Contributor: Eric Le Bras <eric.lebras@gmail.com>

pkgname=cnijfilter-mp510
pkgver=2.70
pkgrel=8
pkgdesc="Canon IJ Printer Driver for Pixma MP510 multifunction"
arch=('i686')
url="http://support-au.canon.com.au/contents/AU/EN/0100084103.html"
license=('GPL2' 'LGPL2.1' 'custom')
depends=('cnijfilter-common270' 'gtk' 'libxml' 'libglade' 'libpng')
makedepends=('rpmextract autoconf>=2.13' 'automake>=1.6' 'tar' 'make' 'gcc')
install=cnijfilter-mp510.install
source=("http://gdlp01.c-wss.com/gds/5/0900007185/02/cnijfilter-common-${pkgver}-2.src.rpm"
	cngpijmonmp510.desktop
	printuimp510.desktop
	98-usbprinter.rules
	cnijfilter-mp510.patch)
md5sums=('478aa71f6f4c81ef788d2136152af4c3'
         '0531790082c6e0dda3f9eaf8263ba402'
         '69be069048ce3e9013b6197114dd370f'
         '32c0372cd453da2f68a91c03c3c25bf0'
         '8bcb33744c79555d54b871d5c795c616')

build() {
  cd ${srcdir}
  rpmextract.sh cnijfilter-common-${pkgver}-2.src.rpm
  tar xzf cnijfilter-common-${pkgver}-2.tar.gz

  cd ${srcdir}/cnijfilter-common-${pkgver}
  patch -p1 -i ../cnijfilter-mp510.patch

  cd ${srcdir}/cnijfilter-common-${pkgver}/ppd
  ./autogen.sh --prefix=/usr || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-common-${pkgver}/cnijfilter
  ./autogen.sh --prefix=/usr --program-suffix=mp510 --enable-libpath=/usr/lib/bjlib --enable-binpath=/usr/bin || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-common-${pkgver}/printui
  ./autogen.sh --prefix=/usr --program-suffix=mp510 --datadir=/usr/share || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-common-${pkgver}/lgmon
  ./autogen.sh --prefix=/usr --program-suffix=mp510 --enable-progpath=/usr/bin || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-common-${pkgver}/cngpijmon
  ./autogen.sh --prefix=/usr --program-suffix=mp510 || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-common-${pkgver}
  install -d ${pkgdir}/usr/lib/bjlib
  install -m 755 293/database/* ${pkgdir}/usr/lib/bjlib
  install -s -m 755 293/libs_bin/*.so.* ${pkgdir}/usr/lib
  install -D LICENSE-cnijfilter-${pkgver}E.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cnijfilter-${pkgver}E.txt

  install -Dm644 "$srcdir/cngpijmonmp510.desktop" "$pkgdir/usr/share/applications/cngpijmonmp510.desktop"
  install -Dm644 "$srcdir/printuimp510.desktop" "$pkgdir/usr/share/applications/printuimp510.desktop"

  rm -rf ${pkgdir}/usr/lib/cups/
  rm ${pkgdir}/usr/share/cups/model/canonip*
  rm ${pkgdir}/usr/share/cups/model/canonmp{160,600}.ppd

  install -Dm644 "$srcdir/98-usbprinter.rules" "$pkgdir/etc/udev/rules.d/98-usbprinter.rules"
}

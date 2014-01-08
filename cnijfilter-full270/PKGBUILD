# Contributor: Eric Le Bras <eric.lebras@gmail.com>
# Contributor: OramahMaalhur <oramahmaalhur @t gmail d0t com>
# Forked cnijfilter-common270  package

[[ "$CARCH" == "x86_64" ]] && _lib32="lib32-" || _lib32=""
pkgname=cnijfilter-full270
pkgver=2.70
pkgrel=1
pkgdesc="Canon IJ Printer Driver 2.70"
arch=('i686' 'x86_64')
conflicts=('cnijfilter-common270' 'cnijfilter-common' 'cnijfilter-common-x86_64')
url="http://support-au.canon.com.au/contents/AU/EN/0900718516.html"
license=('GPL2' 'LGPL2' 'custom')
depends=("${_lib32}gtk" "${_lib32}libxml" "${_lib32}popt" "libglade" "${_lib32}libcups")
makedepends=('rpmextract autoconf>=2.13' 'automake>=1.6' 'tar' 'make' 'gcc')
install=cnijfilter.install
source=("http://gdlp01.c-wss.com/gds/5/0900007185/02/cnijfilter-common-${pkgver}-2.src.rpm"
	cngpijmon.desktop
	printui.desktop
	libpng.patch
	cups.patch)
md5sums=('478aa71f6f4c81ef788d2136152af4c3'
         '0be3f1e00e5d50ceff80bd0a0c663525'
         'a3719369f80f368352f89acf99c8c4bb'
         '0f4d54b1b678dca03d8fe9232eec425d'
         'e487e4ee940766f334b55bbbedd004ba')

## PLEASE INSERT YOUR MODEL HERE
# ONE OF:  ip3300 mp510 ip4300 mp600 mp160 ip2500 ip1800 ip90

_printer_model=ip1800

build() {
  
  if [ "$CARCH" == "x86_64" ]; then
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  fi
	
  cd ${srcdir}
  rpmextract.sh cnijfilter-common-${pkgver}-2.src.rpm
  tar xzf cnijfilter-common-${pkgver}-2.tar.gz

  #applying patches
  cd ${srcdir}/cnijfilter-common-${pkgver}
  patch -p0 < "${srcdir}/libpng.patch"
  patch -p0 < "${srcdir}/cups.patch"

  cd ${srcdir}/cnijfilter-common-${pkgver}/libs
  ./autogen.sh --prefix=/usr || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-common-${pkgver}/ppd
  ./autogen.sh --prefix=/usr || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-common-${pkgver}/cngpij
  ./autogen.sh --prefix=/usr || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-common-${pkgver}/cnijfilter
  ./autogen.sh --prefix=/usr --program-suffix=${_printer_model} --enable-libpath=/usr/lib/bjlib --enable-binpath=/usr/bin    || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-common-${pkgver}/printui
  ./autogen.sh --prefix=/usr --program-suffix=${_printer_model} --datadir=/usr/share   || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-common-${pkgver}/lgmon
  ./autogen.sh --prefix=/usr --program-suffix=${_printer_model} --enable-progpath=/usr/bin   || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-common-${pkgver}/cngpijmon
  ./autogen.sh --prefix=/usr --program-suffix=${_printer_model}  || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1
  
  cd ${srcdir}/cnijfilter-common-${pkgver}/pstocanonij
  ./autogen.sh --prefix=/usr || return 1
  make clean
  make || return 1
  make install DESTDIR=${pkgdir} || return 1

  cd ${srcdir}/cnijfilter-common-${pkgver}
  install -d ${pkgdir}/usr/lib/bjlib
  install -m 755 312/database/* ${pkgdir}/usr/lib/bjlib
  install -s -m 755 312/libs_bin/*.so.* ${pkgdir}/usr/lib
  install -D LICENSE-cnijfilter-${pkgver}E.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cnijfilter-${pkgver}E.txt

  install -Dm644 "$srcdir/cngpijmon.desktop" "$pkgdir/usr/share/applications/cngpijmon.desktop"
  install -Dm644 "$srcdir/printui.desktop" "$pkgdir/usr/share/applications/printui.desktop"
  
  sed -i "s/Exec=cngpijmon/Exec=cngpijmon${_printer_model}/" "$pkgdir/usr/share/applications/cngpijmon.desktop"
  sed -i "s/Exec=printui/Exec=printui${_printer_model}/" "$pkgdir/usr/share/applications/printui.desktop"

}

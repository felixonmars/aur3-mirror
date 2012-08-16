# Maintainer: Jakob Nixdorf <flocke@shadowice.org>
# Thanks to	elb for the cnijfilter-common320 and cnijfilter-ip4700series PKGBUILDs
#	and	lorim for the lib32-cnijfilter-mp560 PKGBUILD

pkgbase=lib32-cnijfilter320
pkgname=('lib32-cnijfilter320-common')

# Uncomment the driver(s) you want to build
#pkgname+=('lib32-cnijfilter-mp250')
#pkgname+=('lib32-cnijfilter-mp270')
#pkgname+=('lib32-cnijfilter-mp490')
#pkgname+=('lib32-cnijfilter-mp550')
pkgname+=('lib32-cnijfilter-mp560')
#pkgname+=('lib32-cnijfilter-mp640')
#pkgname+=('lib32-cnijfilter-ip4700')

pkgver=3.20
_pkgreview=1
pkgrel=1
pkgdesc="Canon IJ Printer Driver Version 3.20 for Canon MP250, MP270, MP490, MP550, MP560, MP640 and iP4700 (32-bit, split package)"
url="http://software.canon-europe.com/products/0010756.asp"
arch=('x86_64')
license=('custom')
depends=('lib32-popt' 'lib32-gtk2>=2.8.0' 'lib32-libxml2>=2.6.24' 'ghostscript')
makedepends=('autoconf>=2.13' 'automake>=1.6' 'tar' 'make' 'gcc-multilib')
conflicts=('cnijfilter-common')
source=(http://gdlp01.c-wss.com/gds/7/0100002367/01/cnijfilter-source-${pkgver}-${_pkgreview}.tar.gz
	id.patch
	cups.patch
	libpng15.patch)

build() {
  export CC="gcc -m32"

  cd ${srcdir}/cnijfilter-source-${pkgver}-${_pkgreview}
  patch -p1 -i ${srcdir}/id.patch
  patch -p1 -i ${srcdir}/cups.patch
  patch -p1 -i ${srcdir}/libpng15.patch

  for i in "libs" "cngpij" "pstocanonij" "backend" "backendnet" "lgmon" "cngpijmon/cnijnpr"; do
    cd ${srcdir}/cnijfilter-source-${pkgver}-${_pkgreview}/$i
    ./autogen.sh --prefix=/usr --enable-progpath=/usr/bin --libdir=/usr/lib32
    if [ "$i" == "pstocanonij" ]; then
      sed -i 's:filterdir =.*$:filterdir = /usr/lib/cups/filter:g' filter/Makefile
    fi
    make
  done
}

package_lib32-cnijfilter320-common() {
  pkgdesc="Canon IJ Printer Driver Version 3.20 - Common files (32-bit)"
  depends=('lib32-popt' 'lib32-gtk2>=2.8.0' 'lib32-libxml2>=2.6.24' 'ghostscript')
  conflicts=('cnijfilter-common')
  install=cnijfilter.install

  for i in "libs" "cngpij" "pstocanonij" "backend" "backendnet" "cngpijmon/cnijnpr"; do
    cd ${srcdir}/cnijfilter-source-${pkgver}-${_pkgreview}/$i
    make install DESTDIR=${pkgdir}
  done

  cd ${srcdir}/cnijfilter-source-${pkgver}-${_pkgreview}
  install -d ${pkgdir}/usr/lib/bjlib
  install -c -m 644 com/ini/cnnet.ini ${pkgdir}/usr/lib/bjlib
  install -d ${pkgdir}/usr/lib32
  install -c -s -m 755 com/libs_bin/libcnnet.so.1.1.0 ${pkgdir}/usr/lib32
  ln -s libcnnet.so.1.1.0 ${pkgdir}/usr/lib32/libcnnet.so

  install -D LICENSE-cnijfilter-${pkgver}EN.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cnijfilter-${pkgver}EN.txt
}

_package_driver() {
  pkgdesc="Canon IJ Printer Driver Version 3.20 - Driver for $3 (32-bit)"
  depends=("lib32-cnijfilter320-common=${pkgver}")
  conflicts=('cnijfilter-common')
  install=cnijfilter.install

  cd ${srcdir}/cnijfilter-source-${pkgver}-${_pkgreview}/ppd
  ./autogen.sh --prefix=/usr --program-suffix=$1
  make
  make install DESTDIR=${pkgdir}

  for i in "cnijfilter" "printui" "lgmon" "cngpijmon"; do
    cd ${srcdir}/cnijfilter-source-${pkgver}-${_pkgreview}/$i
    ./autogen.sh --prefix=/usr --program-suffix=$1 --enable-progpath=/usr/bin --libdir=/usr/lib32
    make
    make install DESTDIR=${pkgdir}
  done

  cd ${srcdir}/cnijfilter-source-${pkgver}-${_pkgreview}
  install -d ${pkgdir}/usr/lib/bjlib
  install -m 755 $2/database/* ${pkgdir}/usr/lib/bjlib
  install -d ${pkgdir}/usr/lib32
  install -s -m 755 $2/libs_bin/*.so.* ${pkgdir}/usr/lib32

  install -d -m 755 ${pkgdir}/usr/share/licenses
  ln -s lib32-cnijfilter320-common ${pkgdir}/usr/share/licenses/${pkgname}
}

package_lib32-cnijfilter-mp250() {
  _package_driver "mp250" "356" "MP250"
}

package_lib32-cnijfilter-mp270() {
  _package_driver "mp270" "357" "MP270"
}

package_lib32-cnijfilter-mp490() {
  _package_driver "mp490" "358" "MP490"
}

package_lib32-cnijfilter-mp550() {
  _package_driver "mp550" "359" "MP550"
}

package_lib32-cnijfilter-mp560() {
  _package_driver "mp560" "360" "MP560"
}

package_lib32-cnijfilter-mp640() {
  _package_driver "mp640" "362" "MP640"
}

package_lib32-cnijfilter-ip4700() {
  _package_driver "ip4700" "361" "iP4700"
}

# Fix description display on the AUR website
pkgdesc="Canon IJ Printer Driver Version 3.20 for Canon MP250, MP270, MP490, MP550, MP560, MP640 and iP4700 (32-bit, split package)"

md5sums=('0a40b46016511d59d1d0a3d3d9a653dd'
         '7db8fce695e47a9876c879e1c3a9c491'
         '39907f6b82a4dd67d6324050a17fb961'
         'e75b117cd7a399c0861c4e8e10c30294')

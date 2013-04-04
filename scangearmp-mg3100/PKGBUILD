# Maintainer: (Doktor Schliemann) <doktor.schliemann@gmail.com>
# Original Contributors: Fortunato Ventre (voRia) <vorione@gmail.com>
#                        Custom Processing Unlimited (CPUnltd) <CPUnltd@gmail.com>
#                        Giancarlo Bianchi <giancarlobianchi76@gmail.com>
#			 Nopsty <michi@nicce.at>
pkgname=scangearmp-mg3100
pkgver=1.80
pkgrel=3
_pkgver=1.80-1
pkgdesc="Canon Scanner Driver (for MG3100 series)"
url="http://support-my.canon-asia.com/contents/MY/EN/0100393102.html"
arch=('i686' 'x86_64')
license=('custom')
depends=('sane' 'libpng>=1.5')
install=scangearmp-mg3100.install
source=(http://gdlp01.c-wss.com/gds/1/0100003931/01/scangearmp-source-${_pkgver}.tar.gz
	'libpng15.patch'
	'fix_configure.patch')

build() {
  if [ "$CARCH" == "x86_64" ]; then  
    libdir=libs_bin64
  else
    libdir=libs_bin32
  fi

 # Patch
  cd "${srcdir}"/scangearmp-source-${_pkgver}
  patch -p1 -i ../libpng15.patch
  patch -p1 -i ../fix_configure.patch

  cd ${srcdir}/scangearmp-source-${_pkgver}/scangearmp
  ./autogen.sh --prefix=/usr --enable-libpath=/usr/lib LDFLAGS="-lm -L`pwd`/../com/${libdir}"
  # Force the use of system's libtool
  rm -f libtool
  ln -s `which libtool` .
  # Build package
  make clean || return 1
  make || return 1
  # Install package
  install -d -m 0755 $pkgdir/usr/lib/bjlib
  make DESTDIR=${pkgdir} install || return 1

  # Install SANE configuration file
  install -d -m 0755 $pkgdir/etc/sane.d/
  install -m 0644 ${srcdir}/scangearmp-source-${_pkgver}/scangearmp/backend/canon_mfp.conf $pkgdir/etc/sane.d/canon_mfp.conf

  # Install common libraries
  install -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/com/${libdir}/libcncpcmcm.so.8.0.1 ${pkgdir}/usr/lib/
  install -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/com/${libdir}/libcncpmsimg.so.1.0.2 ${pkgdir}/usr/lib/
  install -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/com/${libdir}/libcncpmslld.so.1.0.1 ${pkgdir}/usr/lib/
  install -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/com/${libdir}/libcncpmsui.so.1.8.0 ${pkgdir}/usr/lib/
  install -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/com/${libdir}/libcncpnet.so.1.2.2 ${pkgdir}/usr/lib/

  # Install mg3100 series specific libraries
  install -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/387/${libdir}/libcncpmsimg387.so.1.8.0 ${pkgdir}/usr/lib/
  install -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/387/${libdir}/libcncpmslld387c.so.1.04.1 ${pkgdir}/usr/lib/
  install -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/387/${libdir}/libcncpmslld387.so.1.8.0 ${pkgdir}/usr/lib/
  # Create symbolic links
  cd ${pkgdir}/usr/lib/
  ln -s libcncpcmcm.so.8.0.1 libcncpcmcm.so
  ln -s libcncpmsimg.so.1.0.2 libcncpmsimg.so
  ln -s libcncpmslld.so.1.0.1 libcncpmslld.so
  ln -s libcncpmsui.so.1.8.0 libcncpmsui.so
  ln -s libcncpnet.so.1.2.2 libcncpnet.so

  ln -s libcncpmsimg387.so.1.8.0 libcncpmsimg387.so
  ln -s libcncpmslld387c.so.1.04.1 libcncpmslld387c.so
  ln -s libcncpmslld387.so.1.8.0 libcncpmslld387.so
  
  # Make scangearmp usable from gimp
  install -d -m 0755 ${pkgdir}/usr/lib/gimp/2.0/plug-ins/
  ln -s /usr/bin/scangearmp ${pkgdir}/usr/lib/gimp/2.0/plug-ins/

  # Install .tbl and .dat files for mg3100 series
  install -D -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/387/cnc1752d.tbl ${pkgdir}/usr/lib/bjlib/
  install -D -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/387/cnc_3870.tbl ${pkgdir}/usr/lib/bjlib/
  install -D -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/387/CNC_387H.DAT ${pkgdir}/usr/lib/bjlib/
  install -D -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/387/CNC_387P.DAT ${pkgdir}/usr/lib/bjlib/

  # Install udev rules
  install -D -m 0644 ${srcdir}/scangearmp-source-${_pkgver}/scangearmp/etc/80-canon_mfp.rules ${pkgdir}/etc/udev/rules.d/80-canon_mfp.rules

  # Install .ini file
  install -D -m 0666 ${srcdir}/scangearmp-source-${_pkgver}/com/ini/canon_mfp_net.ini ${pkgdir}/usr/lib/bjlib/

  # Install license file
  cd ${srcdir}/scangearmp-source-${_pkgver}
  install -D LICENSE-scangearmp-${pkgver}EN.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-scangearmp-${pkgver}EN.txt

  # Remove unneeded files
  rm ${pkgdir}/usr/lib/libsane-canon_mfp.a
  rm ${pkgdir}/usr/lib/libsane-canon_mfp.la
}
md5sums=('88e3891918357304a9f527d043b435d2'
	 '5fd4f2f00aad11ff108a2c642cf1a7c1'
	 'f1b3ca4fbea0177f1ce9fa85439f9c78')

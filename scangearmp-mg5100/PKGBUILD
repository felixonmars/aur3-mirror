#Maintainer: Custom Processing Unlimited (CPUnltd) <CPUnltd 'at' gmail 'dot' com>
# Contributor: Fortunato Ventre (voRia) <vorione@gmail.com>
# Contributor: LaMorte <lamorte 'at' gmail 'dot' com>
pkgname=scangearmp-mg5100
pkgver=1.60
pkgrel=2
_pkgver=1.60-1
pkgdesc="Canon Scanner Driver (for MG5100 series)"
url="http://support-my.canon-asia.com/contents/MY/EN/0100303302.html"
arch=('i686' 'x86_64')
license=('custom')
depends=('sane')
source=(http://gdlp01.c-wss.com/gds/3/0100003033/01/scangearmp-source-${_pkgver}.tar.gz)
md5sums=('15782d670f9d5c5904e00610508114f3')

build() {
  if [ "$CARCH" == "x86_64" ]; then  
    libdir=libs_bin64
  else
    libdir=libs_bin32
  fi

  cd ${srcdir}/scangearmp-source-${_pkgver}/scangearmp
  ./autogen.sh --prefix=/usr LDFLAGS="-L`pwd`/../com/${libdir}"
  # Force the use of system's libtool
  rm libtool
  ln -s `which libtool` .
  # Build package
  make clean || return 1
  make || return 1
  # Install package
  make install DESTDIR=${pkgdir} || return 1

  #Install common libraries
  install -m 755 ${srcdir}/scangearmp-source-${_pkgver}/com/${libdir}/libcncpcmcm.so.8.0.1 ${pkgdir}/usr/lib/
  install -m 755 ${srcdir}/scangearmp-source-${_pkgver}/com/${libdir}/libcncpmsimg.so.1.0.2 ${pkgdir}/usr/lib/
  install -m 755 ${srcdir}/scangearmp-source-${_pkgver}/com/${libdir}/libcncpmslld.so.1.0.1 ${pkgdir}/usr/lib/
  install -m 755 ${srcdir}/scangearmp-source-${_pkgver}/com/${libdir}/libcncpmsui.so.1.6.0 ${pkgdir}/usr/lib/
  install -m 755 ${srcdir}/scangearmp-source-${_pkgver}/com/${libdir}/libcncpnet.so.1.2.0 ${pkgdir}/usr/lib/
  # Install mg5200 series specific libraries
  install -m 755 ${srcdir}/scangearmp-source-${_pkgver}/373/${libdir}/libcncpmsimg373.so.1.6.0 ${pkgdir}/usr/lib/
  install -m 755 ${srcdir}/scangearmp-source-${_pkgver}/373/${libdir}/libcncpmslld373c.so.1.04.1 ${pkgdir}/usr/lib/
  install -m 755 ${srcdir}/scangearmp-source-${_pkgver}/373/${libdir}/libcncpmslld373.so.1.6.0 ${pkgdir}/usr/lib/
  # Create symbolic links
  cd ${pkgdir}/usr/lib/
  ln -s libcncpcmcm.so.8.0.1 libcncpcmcm.so
  ln -s libcncpmsimg.so.1.0.2 libcncpmsimg.so
  ln -s libcncpmslld.so.1.0.1 libcncpmslld.so
  ln -s libcncpmsui.so.1.6.0 libcncpmsui.so
  ln -s libcncpnet.so.1.2.0 libcncpnet.so
  ln -s libcncpmsimg373.so.1.6.0 libcncpmsimg373.so
  ln -s libcncpmslld373c.so.1.04.1 libcncpmslld373c.so
  ln -s libcncpmslld373.so.1.6.0 libcncpmslld373.so
  
  # Make scangearmp usable from gimp
  install -d -m 755 ${pkgdir}/usr/lib/gimp/2.0/plug-ins/
  ln -s /usr/bin/scangearmp ${pkgdir}/usr/lib/gimp/2.0/plug-ins/

  # Install .tbl and .dat files for mg5200 series
  install -D -m 755 ${srcdir}/scangearmp-source-${_pkgver}/373/cnc1748d.tbl ${pkgdir}/usr/lib/bjlib/
  install -D -m 755 ${srcdir}/scangearmp-source-${_pkgver}/373/cnc_3730.tbl ${pkgdir}/usr/lib/bjlib/
  install -D -m 755 ${srcdir}/scangearmp-source-${_pkgver}/373/CNC5100.DAT ${pkgdir}/usr/lib/bjlib/
  install -D -m 755 ${srcdir}/scangearmp-source-${_pkgver}/373/CNC5100P.DAT ${pkgdir}/usr/lib/bjlib/

  # Install udev rules
  install -D -m 644 ${srcdir}/scangearmp-source-${_pkgver}/scangearmp/etc/80-canon_mfp.rules ${pkgdir}/etc/udev/rules.d/80-canon_mfp.rules

  # Install .ini file
  install -D -m 666 ${srcdir}/scangearmp-source-${_pkgver}/com/ini/canon_mfp_net.ini ${pkgdir}/usr/lib/bjlib/

  # Install license file
  cd ${srcdir}/scangearmp-source-${_pkgver}
  install -D LICENSE-scangearmp-${pkgver}EN.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-scangearmp-${pkgver}EN.txt

  # Remove unneeded files
  rm ${pkgdir}/usr/lib/libsane-canon_mfp.a
  rm ${pkgdir}/usr/lib/libsane-canon_mfp.la
}

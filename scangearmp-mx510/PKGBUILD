# Creator: Pavol Hluchy (Lopo) <lopo at losys dot eu>
# Maintainer: BarbUk <barbarisme at gmail dot com>
_model=mx510
pkgname=scangearmp-${_model}
pkgver=1.90
pkgrel=2
_pkgver=1.90-1
pkgdesc="Canon Scanner Driver (for ${_model} series)"
url="http://support-au.canon.com.au/contents/AU/EN/0100414302.html"
arch=('i686' 'x86_64')
license=('custom')
depends=('sane' 'gtk2' 'libpng>=1.2.8')
makedepends=('findutils' 'gawk')
source=(
    "http://gdlp01.c-wss.com/gds/3/0100004143/01/scangearmp-source-${_pkgver}.tar.gz"
    'fix_scanfile.patch'
    'fix_configure.patch'
)
md5sums=(
    '89d602545625157f1ec579e887fbce94'
	'13df0530aaf3283490e09427070311a8'
    'fa6365bcdd7ae7e6ae8976cb534fd2a5'
)

prepare() {
  # Apply patch
  cd ${srcdir}/scangearmp-source-${_pkgver}
  patch -p1 -i ${srcdir}/fix_configure.patch
  patch -p1 -i ${srcdir}/fix_scanfile.patch
}

build() {
  _modelid=`grep ^PRINTER_DEPEND_PKG=scangearmp-${_model}- ${srcdir}/scangearmp-source-${_pkgver}/debian/scangearmp-${_model}series.postrm \
        | gawk -F- '{print $3}'`
  if [ "$CARCH" == "x86_64" ]; then
    libdir=libs_bin64
  else
    libdir=libs_bin32
  fi
  cd ${srcdir}/scangearmp-source-${_pkgver}/scangearmp
  ./autogen.sh --prefix=/usr LDFLAGS="-L`pwd`/../com/${libdir}" LIBS=-lm
  # Force the use of system's libtool
  rm libtool
  ln -s `which libtool` .
  # Build package
  make clean || return 1
  make || return 1
}

package() {
  _modelid=`grep ^PRINTER_DEPEND_PKG=scangearmp-${_model}- ${srcdir}/scangearmp-source-${_pkgver}/debian/scangearmp-${_model}series.postrm \
        | gawk -F- '{print $3}'`
  if [ "$CARCH" == "x86_64" ]; then
    libdir=libs_bin64
  else
    libdir=libs_bin32
  fi
  cd ${srcdir}/scangearmp-source-${_pkgver}/scangearmp
  # Install package
  make DESTDIR="$pkgdir/" install
  # Install SANE configuration file
  install -d -m 0755 ${pkgdir}/etc/sane.d/
  install -m 0644 ${srcdir}/scangearmp-source-${_pkgver}/scangearmp/backend/canon_mfp.conf ${pkgdir}/etc/sane.d/canon_mfp.conf

  #Install common libraries
  install -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/com/${libdir}/libcncpcmcm.so.*.*.* ${pkgdir}/usr/lib/
  install -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/com/${libdir}/libcncpmsimg.so.*.*.* ${pkgdir}/usr/lib/
  install -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/com/${libdir}/libcncpmslld.so.*.*.* ${pkgdir}/usr/lib/
  install -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/com/${libdir}/libcncpmsui.so.*.*.* ${pkgdir}/usr/lib/
  install -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/com/${libdir}/libcncpnet.so.*.*.* ${pkgdir}/usr/lib/
  # Install ${_model} series specific libraries
  install -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/${_modelid}/${libdir}/libcncpmsimg${_modelid}.so.*.*.* ${pkgdir}/usr/lib/
  install -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/${_modelid}/${libdir}/libcncpmslld${_modelid}c.so.*.*.* ${pkgdir}/usr/lib/
  install -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/${_modelid}/${libdir}/libcncpmslld${_modelid}.so.*.*.* ${pkgdir}/usr/lib/
  # Create symbolic links
  cd ${pkgdir}/usr/lib/
  ln -s libcncpcmcm.so.*.*.* libcncpcmcm.so
  ln -s libcncpmsimg.so.*.*.* libcncpmsimg.so
  ln -s libcncpmslld.so.*.*.* libcncpmslld.so
  ln -s libcncpmsui.so.*.*.* libcncpmsui.so
  ln -s libcncpnet.so.*.*.* libcncpnet.so
  ln -s libcncpmsimg${_modelid}.so.*.*.* libcncpmsimg${_modelid}.so
  ln -s libcncpmslld${_modelid}c.so.*.*.* libcncpmslld${_modelid}c.so
  ln -s libcncpmslld${_modelid}.so.*.*.* libcncpmslld${_modelid}.so

  # Make scangearmp usable from gimp
  install -d -m 0755 ${pkgdir}/usr/lib/gimp/2.0/plug-ins/
  ln -s /usr/bin/scangearmp ${pkgdir}/usr/lib/gimp/2.0/plug-ins/

  # Install .tbl and .dat files for ${_model} series
  install -d -m 0755 ${pkgdir}/usr/lib/bjlib
  install -D -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/${_modelid}/cnc*.tbl ${pkgdir}/usr/lib/bjlib/
  install -D -m 0755 ${srcdir}/scangearmp-source-${_pkgver}/${_modelid}/CNC*.DAT ${pkgdir}/usr/lib/bjlib/

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

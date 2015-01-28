# Maintainer: maz-1 <loveayawaka at gmail dot com>

pkgname=gimp-painter
pkgver=2.8.14
pkgrel=1
pkgdesc="Fork of GIMP aiming to add drawing and painting features to GIMP."
arch=('i686' 'x86_64')
url="http://en.sourceforge.jp/projects/gimp-painter/"
license=('GPL' 'LGPL')
depends=('pygtk' 'lcms' 'libxpm' 'libwmf' 'libxmu' 'librsvg' 'libmng' 'dbus-glib' \
         'libexif' 'gegl' 'jasper' 'desktop-file-utils' 'hicolor-icon-theme' 'babl' 'openexr')
makedepends=('intltool' 'webkitgtk2' 'poppler-glib' 'alsa-lib' 'iso-codes' 'curl' 'ghostscript')
optdepends=('gimp-paint-studio: Extra brushes and accompanying tool presets.Strongly recommended.'
	    'gutenprint: for sophisticated printing only as gimp has built-in cups print support'
            'webkitgtk2: for the help browser'
            'poppler-glib: for pdf support'
            'alsa-lib: for MIDI event controller module'
            'curl: for URI support'
            'ghostscript: for postscript support')
options=('!makeflags')
provides=('gimp=2.8.14')
conflicts=('gimp-devel' 'gimp')
install=gimp.install
source=(http://download.gimp.org/pub/gimp/v${pkgver%.*}/gimp-${pkgver}.tar.bz2
        linux.gpl
        uri-backend-libcurl.patch
         gimp-painter-20150127.patch
         gimp-painter-data.tgz::http://storage.live.com/items/EED7455B8FCA288F%211042?a.tgz)
md5sums=('233c948203383fa078434cc3f8f925cb'
         'bb27bc214261d36484093e857f015f38'
         'e894f4b2ffa92c71448fdd350e9b78c6'
          '92d2fda7742dffea73a7befa348537c4'
          '2348a990b90c066c6489d49201665334')
prepare() {
  cd "${srcdir}/gimp-${pkgver}"
  patch -p1 < ../gimp-painter-20150127.patch
  cp -r ../gimp-painter-data/mypaint-brushes ./data
  cp ../gimp-painter-data/stock-tool-mypaint-16.png ./themes/Default/images/tools/
  cp ../gimp-painter-data/stock-tool-mypaint-22.png ./themes/Default/images/tools/
  touch ./app/dummy.cpp
}
build() {
  cd "${srcdir}/gimp-${pkgver}"
  autoreconf --force --install
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr --sysconfdir=/etc \
    --enable-mp --enable-gimp-console --enable-gimp-remote \
    --enable-python --with-gif-compression=lzw --with-libcurl \
    --without-aa --without-hal --without-gvfs --without-gnomevfs
  make
}

package() {
  cd "${srcdir}/gimp-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -m 644 ${srcdir}/gimp-${pkgver}/libgimp/gimpmypaintbrushselect_pdb.h \
"${pkgdir}"/usr/include/gimp-2.0/libgimp/
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' "${pkgdir}"/usr/lib/gimp/2.0/plug-ins/*.py
  install -D -m644 "${srcdir}/linux.gpl" "${pkgdir}/usr/share/gimp/2.0/palettes/Linux.gpl"
  
  rm "${pkgdir}/usr/share/man/man1/gimp-console.1"
  ln -s gimp-console-${pkgver%.*}.1.gz "${pkgdir}/usr/share/man/man1/gimp-console.1.gz"
  ln -s gimptool-2.0 "${pkgdir}/usr/bin/gimptool"
  ln -sf gimptool-2.0.1.gz "${pkgdir}/usr/share/man/man1/gimptool.1.gz"
}


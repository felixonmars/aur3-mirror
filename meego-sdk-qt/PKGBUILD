# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=meego-sdk-qt
pkgver=4.7.2
pkgrel=2
_rpmver=3.2
pkgdesc='Cross-platform application and UI framework'
arch=('i686' 'x86_64')
_arch=32
[ "$CARCH" = "x86_64" ] && _arch=64
url='http://qt.nokia.com/'
license=('LGPL2')
depends=('mesa' 'sqlite3' 'libmng' 'fontconfig' 'gstreamer0.10-base' 'glib2'
        'libxinerama' 'libxi' 'libxrender' 'libxrandr' 'libxcursor' 'libpulse'
        'libcups' 'fdupes' 'desktop-file-utils')
optdepends=('pulseaudio' 'cups')
makedepends=('sharutils' 'gtk2')
options=('!libtool')
install=${pkgname}.install
source=("http://download.meego.com/live/Tools:/SDK:/Host/Trunk/src/${pkgname}-${pkgver}-${_rpmver}.src.rpm")
md5sums=('0ecaebe118bdf9c540ef83b17a56b593')

build() {
  cd "${srcdir}"
  tar -zxf qt-everywhere-opensource-src-${pkgver}.tar.gz

  cd qt-everywhere-opensource-src-${pkgver}
  patch -p1 -i ../01_configure_quilt_compat.patch
  patch -p1 -i ../03_config_tests_sqlite.patch
  patch -p1 -i ../04_build_translations.patch
  patch -p1 -i ../06_install_qvfb.patch
  patch -p1 -i ../07_invpremul.patch
  patch -p1 -i ../08_qtdebug_syslog.patch
  patch -p1 -i ../09_texture_enable_fix.patch
  patch -p1 -i ../11_honor_all_FreeDesktop_icon_paths.patch
  patch -p1 -i ../add_nostrip_for_debug_packages.patch

  export QTDIR=`pwd`
  export PATH=$QTDIR/bin/:$PATH
  export LDFLAGS=-Wl,--as-needed  
  export LD_LIBRARY_PATH=$QTDIR/lib:$LD_LIBRARY_PATH  
  export QT_PLUGIN_PATH=$QTDIR/plugins

  # FS#24601
  export CXXFLAGS="$CXXFLAGS -fno-strict-aliasing -fpermissive"

  ./configure -confirm-license \
    -prefix "/opt/meego/${pkgname}" \
    -bindir "/opt/meego/${pkgname}/bin" \
    -libdir "/opt/meego/${pkgname}/lib" \
    -docdir "/opt/meego/${pkgname}/share/doc/qt4" \
    -headerdir "/opt/meego/${pkgname}/include/qt4" \
    -datadir "/opt/meego/${pkgname}/share/qt4" \
    -plugindir "/opt/meego/${pkgname}/lib/qt4/plugins" \
    -importdir "/opt/meego/${pkgname}/lib/qt4/imports" \
    -translationdir "/opt/meego/${pkgname}/share/qt4/translations" \
    -sysconfdir "/etc/xdg" \
    -demosdir "/opt/meego/${pkgname}/lib/qt4/demos" \
    -examplesdir "/opt/meego/${pkgname}/lib/qt4/examples" \
    -opensource \
    -fast \
    -no-sql-ibase \
    -no-sql-mysql \
    -no-sql-odbc \
    -no-sql-psql \
    -plugin-sql-sqlite \
    -no-sql-sqlite2 \
    -no-sql-tds \
    -system-sqlite \
    -no-qt3support \
    -xmlpatterns \
    -no-multimedia \
    -audio-backend \
    -phonon \
    -phonon-backend \
    -svg \
    -webkit \
    -script \
    -scripttools \
    -platform linux-g++ \
    -system-zlib \
    -qt-gif \
    -system-libtiff \
    -system-libpng \
    -system-libjpeg \
    -no-rpath \
    -optimized-qmake \
    -dbus-linked \
    -no-separate-debug-info \
    -verbose \
    -gtkstyle \
    -no-nas-sound \
    -opengl desktop \
    -no-egl \
    -arch $_arch \
    -no-openvg \
    -lfontconfig \
    -I/usr/include/freetype2 \
    -I/usr/include/gstreamer-0.10 \
    -I/usr/include/glib-2.0 \
    -I/usr/lib/glib-2.0/include/ \
    -I/usr/include/libxml2/ \
    -qvfb
  make
}

package() {
  cd "${srcdir}"/qt-everywhere-opensource-src-${pkgver}
  make INSTALL_ROOT="${pkgdir}" install

  find "${pkgdir}"/opt/meego/${pkgname}/lib/pkgconfig -type f -name '*.pc' \
    -exec perl -pi -e "s, L${pkgdir}/qt-everywhere-opensource-src-${pkgver}/?\S+,,g" {} \;
  find "${pkgdir}"/opt/meego/${pkgname}/lib -type f -name '*.prl' \
    -exec sed -i -e "/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/" {} \;

  for file in assistant designer linguist; do
    install -Dm644 "${srcdir}"/${file}.desktop "${pkgdir}"/opt/meego/${pkgname}/share/applications/${file}.desktop
    install -Dm644 "${srcdir}"/${file}.png "${pkgdir}"/opt/meego/${pkgname}/share/pixmaps/${file}.png
  done

  # cleanup
  rm -f "${pkgdir}"/opt/meego/${pkgname}/share/qt4/translations/qtconfig_*.qm
  find "${pkgdir}"/opt/meego/${pkgname}/lib/ -depth -type d \( -false \
    -o -name .moc\* \
    -o -name .obj\* \
    -o -name .pch \
    -o -name .rcc \
    \) -print0 | xargs -0 rm -rf

  install -d "${pkgdir}"/usr/bin
  ln -sf /opt/meego/${pkgname}/bin/qmake "${pkgdir}"/usr/bin/meego-sdk-qmake
  ln -sf /opt/meego/${pkgname}/bin/meego-sdk-qmlviewer "${pkgdir}"/usr/bin/meego-sdk-qmlviewer

  install -d "${pkgdir}"/usr/share/applications
  for file in assistant designer linguist; do
    ln -sf /opt/meego/${pkgname}/share/applications/${file}.desktop \
      "${pkgdir}"/usr/share/applications/meego-sdk-${file}.desktop
  done

  install -Dm755 "${srcdir}"/meego-sdk-qmlviewer.sh "${pkgdir}"/opt/meego/${pkgname}/bin/meego-sdk-qmlviewer

  # Private headers
  for module in QtCore QtDeclarative QtGui QtScript; do
    cp -a "${srcdir}"/qt-everywhere-opensource-src-${pkgver}/include/${module}/private \
      "${pkgdir}"/opt/meego/${pkgname}/include/qt4/${module}
  done
  install -d "${pkgdir}"/opt/meego/${pkgname}/src/{corelib,script}
  cp -a "${srcdir}"/qt-everywhere-opensource-src-${pkgver}/src/corelib/{animation,kernel} \
    "${pkgdir}"/opt/meego/${pkgname}/src/corelib
  cp -a "${srcdir}"/qt-everywhere-opensource-src-${pkgver}/src/declarative \
    "${pkgdir}"/opt/meego/${pkgname}/src/
  cp -a "${srcdir}"/qt-everywhere-opensource-src-${pkgver}/src/script/bridge \
    "${pkgdir}"/opt/meego/${pkgname}/src/script
  for component in effects image graphicsview kernel widgets; do  
  cp -a "${srcdir}"/qt-everywhere-opensource-src-${pkgver}/src/gui/${component} \
    "${pkgdir}"/opt/meego/${pkgname}/src/gui  
  done
  cp -a "${srcdir}"/qt-everywhere-opensource-src-${pkgver}/include/phonon/private \
    "${pkgdir}"/opt/meego/${pkgname}/include/qt4/phonon
  install -d "${pkgdir}"/opt/meego/${pkgname}/src/3rdparty/phonon
  cp -a "${srcdir}"/qt-everywhere-opensource-src-${pkgver}/src/3rdparty/phonon/phonon \
    "${pkgdir}"/opt/meego/${pkgname}/src/3rdparty/phonon

  # cleanup
  find "${pkgdir}"/opt/meego/${pkgname}/src -type f -name \*.cpp -delete
  find "${pkgdir}"/opt/meego/${pkgname}/src -depth -type d \( -false \
    -o -name .moc\* \
    -o -name .obj\* \
    -o -name .pch \
    -o -name .rcc \
    \) -print0 | xargs -0 rm -rf

  find "${pkgdir}" -type f -perm /u+x,g+x,o+x \( -false \
    -o -name \*.cpp \
    -o -name \*.h \
    -o -name \*.png \
    \) | xargs chmod -x
}

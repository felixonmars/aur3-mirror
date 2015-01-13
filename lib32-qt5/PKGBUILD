# Maintainer: quequotion <quequotion@bugmenot.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=lib32-qt5
pkgname=('lib32-qt5-base'
         'lib32-qt5-connectivity'
         'lib32-qt5-declarative'
         'lib32-qt5-enginio'
         'lib32-qt5-graphicaleffects'
         'lib32-qt5-imageformats'
         'lib32-qt5-location'
         'lib32-qt5-multimedia'
         'lib32-qt5-quick1'
         'lib32-qt5-quickcontrols'
         'lib32-qt5-script'
         'lib32-qt5-sensors'
         'lib32-qt5-serialport'
         'lib32-qt5-svg'
         'lib32-qt5-tools'
         'lib32-qt5-webkit'
         'lib32-qt5-wayland'
         'lib32-qt5-webchannel'
         'lib32-qt5-webengine'
         'lib32-qt5-websockets'
         'lib32-qt5-x11extras'
         'lib32-qt5-xmlpatterns') # 'lib32-qt5-doc' 'lib32-qt5-translations'
pkgver=5.4.0
pkgrel=1
arch=('i686' 'x86_64')
url='http://qt-project.org/'
license=('GPL3' 'LGPL' 'FDL' 'custom')
pkgdesc='A cross-platform application and UI framework (32bit)'
makedepends=('cups' 'desktop-file-utils' 'geoclue' 'gperf' 'hicolor-icon-theme' 'pciutils' 'postgresql-libs' 'ruby' 'xcb-proto'
            lib32-{at-spi2-core,alsa-lib,bluez-libs,fontconfig,gtk2,gst-plugins-base-libs,gstreamer0.10-{base-plugins,bad},harfbuzz}
            lib32-{xcb-util{,-image,-wm,-keysyms},leveldb,mesa,mtdev,nss,unixodbc,openal,python2,sqlite}
            lib32-lib{xcb,mng,jpeg-turbo,pulse,mariadbclient,fbclient,webp,xslt,xcomposite,xkbcommon-x11}) 
groups=('qt' 'qt5')
_pkgfqn="qt-everywhere-opensource-src-${pkgver}"
source=("http://download.qt-project.org/official_releases/qt/5.4/${pkgver}/single/${_pkgfqn}.tar.xz"
        'assistant.desktop' 'designer.desktop' 'linguist.desktop' 'qdbusviewer.desktop'
        'use-python2.7-32.patch'
        'use-perl-32.patch')
md5sums=('21843b00ecde8956217faab391bc007b'
         '6d5634782ffd088092462d29212cc8d7'
         'ba3ffbdc36c37b0e2896a0f4caaed709'
         '345d5cff0743548eadb9da5e3a6a1753'
         'fe9cd818a8b8e8c3ed3daab21a911a20'
         '57170d6b3e9c27d8a6992a6b2dfe7048'
         'e1fa36a864742a169a8901fec574728e')

prepare() {
  cd ${_pkgfqn}

  sed -i "s|-O2|${CXXFLAGS}|" qtbase/mkspecs/common/{g++,gcc}-base.conf
  sed -i "/^QMAKE_LFLAGS_RPATH/s| -Wl,-rpath,||g" qtbase/mkspecs/common/gcc-base-unix.conf
  sed -i "/^QMAKE_LFLAGS\s/s|+=|+= ${LDFLAGS}|g" qtbase/mkspecs/common/gcc-base.conf

  # Use python2.7-32 for Python 2.x
  patch -p1 -i "${srcdir}"/use-python2.7-32.patch
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2.7-32|" \
    -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2.7-32|" \
    $(find . -name '*.py')
  # Use perl-32 for perl
  patch -Np2 < ../use-perl-32.patch
}

build() {
  cd ${_pkgfqn}

  export QTDIR="${srcdir}"/${_pkgfqn}
  export LD_LIBRARY_PATH="${QTDIR}"/qtbase/lib:"${QTDIR}"/qttools/lib:"${LD_LIBRARY_PATH}"
  export QT_PLUGIN_PATH="${QTDIR}"/qtbase/plugins

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export LDFLAGS='-m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  [[ "${CARCH}" = "i686" ]] && SSE2="-no-sse2"

  PYTHON=/usr/bin/python2.7-32 ./configure -v -confirm-license -opensource \
    -platform linux-g++-32 \
    -xplatform linux-g++-32 \
    -prefix /usr \
    -bindir /usr/lib32/qt/bin \
    -docdir /usr/share/doc/qt \
    -headerdir /usr/lib32/qt/include/qt \
    -datadir /usr/share/qt \
    -sysconfdir /etc/xdg \
    -examplesdir /usr/share/doc/qt/examples \
    -plugin-sql-{psql,mysql,sqlite,odbc,ibase} \
    -system-sqlite \
    -openssl-linked \
    -nomake examples \
    -no-rpath \
    -optimized-qmake \
    -dbus-linked \
    -system-harfbuzz \
    -journald \
    -reduce-relocations ${SSE2} \
    -libdir /usr/lib32/ \
    -archdatadir /usr/lib32/qt/ \
    -I /usr/lib32/mysql/include/ 

  make

  # Fix paths
  #find "${QTDIR}" -name Makefile -exec sed -i "s|/usr/lib32/qt/bin/qdoc|${QTDIR}/qtbase/bin/qdoc|g" {} +
  #find "${QTDIR}" -name Makefile.qmake-docs -exec sed -i "s|/usr/lib32/qt/bin/qdoc|${QTDIR}/qtbase/bin/qdoc|g" {} +
  #find "${QTDIR}" -name Makefile -exec sed -i "s|/usr/lib32/qt/bin/qhelpgenerator|${QTDIR}/qttools/bin/qhelpgenerator|g" {} +
  #find "${QTDIR}" -name Makefile.qmake-docs -exec sed -i "s|/usr/lib32/qt/bin/qhelpgenerator|${QTDIR}/qttools/bin/qhelpgenerator|g" {} +
  #sed -i "s|/usr/lib32/qt/bin/qhelpgenerator|${QTDIR}/qttools/bin/qhelpgenerator|g" qtwebkit/Source/Makefile.api

  #make docs
}

package_lib32-qt5-base() {
  pkgdesc='A cross-platform application and UI framework (32bit)'
  depends=(lib32-{xcb-util-keysyms,dbus,fontconfig,systemd,xcb-util-wm,sqlite,xcb-util-image,icu,lib{jpeg-turbo,gl,xrender,xi}} 'qtchooser')
  optdepends=('lib32-postgresql-libs: PostgreSQL driver'
              'lib32-libmariadbclient: MariaDB driver'
              'lib32-unixodbc: ODBC driver'
              'lib32-libfbclient: Firebird/iBase driver'
              'lib32-mtdev: evdev plugin'
              'lib32-libxkbcommon-x11: xcb plugin'
              'lib32-libsm: xcb plugin'
              'lib32-gtk2: GTK2 plugin')
  provides=('lib32-qt5-base'=$pkgver)
  conflicts=('lib32-qt' 'lib32-qt5-base')
  options=('staticlibs') #libQt5PlatformSupport builds static only

  cd ${_pkgfqn}/qtbase
  make INSTALL_ROOT="${pkgdir}" install

  # Fix wrong path in prl files
  find "${pkgdir}/usr/lib32" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;

  # Fix wrong qmake path in pri file
  sed -i "s|${srcdir}/${_pkgfqn}/qtbase|/usr|" \
    "${pkgdir}"/usr/lib32/qt/mkspecs/modules/qt_lib_bootstrap_private.pri

  # Useful symlinks
  install -d "${pkgdir}"/usr/bin
  for b in "${pkgdir}"/usr/lib32/qt/bin/*; do
    ln -s /usr/lib32/qt/bin/$(basename $b) "${pkgdir}"/usr/bin/$(basename $b)-qt5
  done

  rm -rf "${pkgdir}"/{etc,usr/{share,include,bin}}

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}

package_lib32-qt5-connectivity() {
  pkgdesc='Provides access to Bluetooth hardware (32bit)'
  depends=('lib32-qt5-declarative')
  provides=('lib32-qt5-connectivity'=$pkgver)
  conflicts=('lib32-qt5-connectivity')

  cd ${_pkgfqn}/qtconnectivity
  make INSTALL_ROOT="${pkgdir}" install

  # Fix wrong path in prl files
  find "${pkgdir}/usr/lib32" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;

  rm -rf "${pkgdir}"/{etc,usr/{share,include,bin}}

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}

package_lib32-qt5-declarative() {
  pkgdesc='Classes for QML and JavaScript languages (32bit)'
  depends=(lib32-{qt5-xmlpatterns,libxkbcommon-x11})
  provides=('lib32-qt5-declarative'=$pkgver)
  conflicts=('lib32-qt' 'lib32-qt5-declarative')

  cd ${_pkgfqn}/qtdeclarative
  make INSTALL_ROOT="${pkgdir}" install

  # Fix wrong path in prl files
  find "${pkgdir}/usr/lib32" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;

  # Useful symlinks
  install -d "${pkgdir}"/usr/bin
  for b in "${pkgdir}"/usr/lib32/qt/bin/*; do
    ln -s /usr/lib32/qt/bin/$(basename $b) "${pkgdir}"/usr/bin/$(basename $b)-qt5
  done

  rm -rf "${pkgdir}"/{etc,usr/{share,include,bin}}

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}

#package_lib32-qt5-doc() {
#  pkgdesc='A cross-platform application and UI framework (Documentation) (32bit)'
#  depends=('lib32-qt5-base')
#  arch=('any')
#  conflicts=('lib32-qt-doc')
#  replaces=('lib32-qt-doc')
#  provides=('lib32-qt-doc')
#  options=('docs' '!emptydirs')
#  groups=()
#
#  cd ${_pkgfqn}
#  make INSTALL_ROOT="${pkgdir}" install_docs
#
#  rm -rf "${pkgdir}"/{etc,usr/{share,include,bin}}
#
#  install -D -m644 LGPL_EXCEPTION.txt \
#    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
#}

package_lib32-qt5-enginio() {
  pkgdesc='A Backend-as-a-Service solution to ease the backend development for connected and data-driven application (32bit)'
  depends=('lib32-qt5-declarative')
  provides=('lib32-qt5-enginio'=$pkgver)
  conflicts=('lib32-qt5-enginio')

  cd ${_pkgfqn}/qtenginio
  make INSTALL_ROOT="${pkgdir}" install

  # Fix wrong path in prl files
  find "${pkgdir}/usr/lib32" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;

  rm -rf "${pkgdir}"/{etc,usr/{share,include,bin}}

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}

package_lib32-qt5-xmlpatterns() {
  pkgdesc='Support for XPath, XQuery, XSLT and XML schema validation (32bit)'
  depends=('lib32-qt5-base')
  provides=('lib32-qt5-xmlpatterns'=$pkgver)
  conflicts=('lib32-qt' 'lib32-qt5-xmlpatterns')

  cd ${_pkgfqn}/qtxmlpatterns
  make INSTALL_ROOT="${pkgdir}" install

  # Fix wrong path in prl files
  find "${pkgdir}/usr/lib32" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;

  # Useful symlinks
  install -d "${pkgdir}"/usr/bin
  for b in "${pkgdir}"/usr/lib32/qt/bin/*; do
    ln -s /usr/lib32/qt/bin/$(basename $b) "${pkgdir}"/usr/bin/$(basename $b)-qt5
  done

  rm -rf "${pkgdir}"/{etc,usr/{share,include,bin}}

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}

#package_lib32-qt5-translations() {
#  pkgdesc='A cross-platform application and UI framework (Translations) (32bit)'
#  depends=('lib32-qt5-base')
#  conflicts=('lib32-qt')
#
#  cd ${_pkgfqn}/qttranslations
#  make INSTALL_ROOT="${pkgdir}" install
#
#  rm -rf "${pkgdir}"/{etc,usr/{share,include,bin}}
#
#  install -D -m644 LGPL_EXCEPTION.txt \
#    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
#}

package_lib32-qt5-multimedia() {
  pkgdesc='Classes for audio, video, radio and camera functionality (32bit)'
  depends=(lib32-{qt5-declarative,libpulse,gstreamer0.10-base,openal})
  provides=('lib32-qt5-multimedia'=$pkgver)
  conflicts=('lib32-qt' 'lib32-qt5-multimedia')

  cd ${_pkgfqn}/qtmultimedia
  make INSTALL_ROOT="${pkgdir}" install

  # Fix wrong path in prl files
  find "${pkgdir}/usr/lib32" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;

  rm -rf "${pkgdir}"/{etc,usr/{share,include,bin}}

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}

package_lib32-qt5-graphicaleffects() {
  pkgdesc='Graphical effects for use with Qt Quick 2 (32bit)'
  depends=('lib32-qt5-declarative')
  provides=('lib32-qt5-graphicaleffects'=$pkgver)
  conflicts=('lib32-qt5-graphicaleffects')

  cd ${_pkgfqn}/qtgraphicaleffects
  make INSTALL_ROOT="${pkgdir}" install

  rm -rf "${pkgdir}"/{etc,usr/{share,include,bin}}

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}

package_lib32-qt5-imageformats() {
  pkgdesc='Plugins for additional image formats: TIFF, MNG, TGA, WBMP (32bit)'
  depends=(lib32-{qt5-base,jasper,libmng})
  provides=('lib32-qt5-imageformats'=$pkgver)
  conflicts=('lib32-qt' 'lib32-qt5-imageformats')

  cd ${_pkgfqn}/qtimageformats
  make INSTALL_ROOT="${pkgdir}" install

  rm -rf "${pkgdir}"/{etc,usr/{share,include,bin}}

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}

package_lib32-qt5-location() {
  pkgdesc='Provides access to position, satellite and area monitoring classes (32bit)'
  depends=('lib32-qt5-declarative')
  provides=('lib32-qt5-location'=$pkgver)
  conflicts=('lib32-qt5-location')

  cd ${_pkgfqn}/qtlocation
  make INSTALL_ROOT="${pkgdir}" install

  # Fix wrong path in prl files
  find "${pkgdir}/usr/lib32" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;

  rm -rf "${pkgdir}"/{etc,usr/{share,include,bin}}

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}

package_lib32-qt5-quick1() {
  pkgdesc='Qt Declarative is provided for Qt 4 compatibility (32bit)'
  depends=(lib32-{qt5-webkit,qt5-script})
  provides=('lib32-qt5-quick1'=$pkgver)
  conflicts=('lib32-qt' 'lib32-qt5-quick1')

  cd ${_pkgfqn}/qtquick1
  make INSTALL_ROOT="${pkgdir}" install

  # Fix wrong path in prl files
  find "${pkgdir}/usr/lib32" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;

  # Useful symlinks
  install -d "${pkgdir}"/usr/bin
  for b in "${pkgdir}"/usr/lib32/qt/bin/*; do
    ln -s /usr/lib32/qt/bin/$(basename $b) "${pkgdir}"/usr/bin/$(basename $b)-qt5
  done

  rm -rf "${pkgdir}"/{etc,usr/{share,include,bin}}

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}

package_lib32-qt5-quickcontrols() {
  pkgdesc='Reusable Qt Quick based UI controls to create classic desktop-style user interfaces (32bit)'
  depends=('lib32-qt5-declarative')
  provides=('lib32-qt5-quickcontrols'=$pkgver)
  conflicts=('lib32-qt5-quickcontrols')

  cd ${_pkgfqn}/qtquickcontrols
  make INSTALL_ROOT="${pkgdir}" install

  rm -rf "${pkgdir}"/{etc,usr/{share,include,bin}}

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}

package_lib32-qt5-script() {
  pkgdesc='Classes for making Qt applications scriptable. Provided for Qt 4.x compatibility (32bit)'
  depends=('lib32-qt5-base')
  provides=('lib32-qt5-script'=$pkgver)
  conflicts=('lib32-qt' 'lib32-qt5-script')

  cd ${_pkgfqn}/qtscript
  make INSTALL_ROOT="${pkgdir}" install

  # Fix wrong path in prl files
  find "${pkgdir}/usr/lib32" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;

  rm -rf "${pkgdir}"/{etc,usr/{share,include,bin}}

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}

package_lib32-qt5-sensors() {
  pkgdesc='Provides access to sensor hardware and motion gesture recognition (32bit)'
  depends=('lib32-qt5-declarative')
  provides=('lib32-qt5-sensors'=$pkgver)
  conflicts=('lib32-qt5-sensors')

  cd ${_pkgfqn}/qtsensors
  make INSTALL_ROOT="${pkgdir}" install

  # Fix wrong path in prl files
  find "${pkgdir}/usr/lib32" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;

  rm -rf "${pkgdir}"/{etc,usr/{share,include,bin}}

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}

package_lib32-qt5-serialport() {
  pkgdesc='Provides access to hardware and virtual serial ports (32bit)'
  depends=('lib32-qt5-base')
  provides=('lib32-qt5-serialport'=$pkgver)
  conflicts=('lib32-qt5-serialport')

  cd ${_pkgfqn}/qtserialport
  make INSTALL_ROOT="${pkgdir}" install

  # Fix wrong path in prl files
  find "${pkgdir}/usr/lib32" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;

  rm -rf "${pkgdir}"/{etc,usr/{share,include,bin}}

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}

package_lib32-qt5-svg() {
  pkgdesc='Classes for displaying the contents of SVG files (32bit)'
  depends=('lib32-qt5-base')
  provides=('lib32-qt5-svg'=$pkgver)
  conflicts=('lib32-qt' 'lib32-qt5-svg')

  cd ${_pkgfqn}/qtsvg
  make INSTALL_ROOT="${pkgdir}" install

  # Fix wrong path in prl files
  find "${pkgdir}/usr/lib32" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;

  rm -rf "${pkgdir}"/{etc,usr/{share,include,bin}}

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt

}

package_lib32-qt5-tools() {
  pkgdesc='A cross-platform application and UI framework (Development Tools, QtHelp) (32bit)'
  depends=('lib32-qt5-webkit' 'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils') # 'lib32-qt5-translations'
  optdepends=('lib32-qt5-doc: documentation')
  provides=('lib32-qt5-tools'=$pkgver)
  conflicts=('lib32-qt5-tools')
  #install='qt5-tools.install'
  conflicts=('lib32-qt')
  options=('staticlibs') # libQt5UiTools builds as static only$

  cd ${_pkgfqn}/qttools
  make INSTALL_ROOT="${pkgdir}" install

  # install missing icons and desktop files
  for icon in src/linguist/linguist/images/icons/linguist-*-32.png ; do
    size=$(echo $(basename ${icon}) | cut -d- -f2)
    install -p -D -m644 ${icon} \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/linguist.png"
  done

  install -D -m644 src/assistant/assistant/images/assistant.png \
    "${pkgdir}/usr/share/icons/hicolor/32x32/apps/assistant.png"
  install -D -m644 src/assistant/assistant/images/assistant-128.png \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/assistant.png"
  install -D -m644 src/designer/src/designer/images/designer.png \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/designer.png"
  install -D -m644 src/qdbus/qdbusviewer/images/qdbusviewer.png \
    "${pkgdir}/usr/share/icons/hicolor/32x32/apps/qdbusviewer.png"
  install -D -m644 src/qdbus/qdbusviewer/images/qdbusviewer-128.png \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/qdbusviewer.png"
  install -d "${pkgdir}/usr/share/applications"
  install -m644 "${srcdir}"/{linguist,designer,assistant,qdbusviewer}.desktop \
    "${pkgdir}/usr/share/applications/"

  # Fix wrong path in prl files
  find "${pkgdir}/usr/lib32" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;

  # Useful symlinks
  install -d "${pkgdir}"/usr/bin
  for b in "${pkgdir}"/usr/lib32/qt/bin/*; do
    ln -s /usr/lib32/qt/bin/$(basename $b) "${pkgdir}"/usr/bin/$(basename $b)-qt5
  done

  rm -rf "${pkgdir}"/{etc,usr/{share,include,bin}}

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}

package_lib32-qt5-webkit() {
  pkgdesc='Classes for a WebKit2 based implementation and a new QML API (32bit)'
  depends=(lib32-{qt5-sensors,qt5-location,qt5-webchannel,gst-plugins-base,libxslt,libxcomposite,nss})
  provides=('lib32-qt5-webkit'=$pkgver)
  conflicts=('lib32-qt5-webkit')
  license=('GPL3' 'LGPL' 'FDL')

  cd ${_pkgfqn}/qtwebkit
  make INSTALL_ROOT="${pkgdir}" install

  # Fix wrong path in prl files
  find "${pkgdir}/usr/lib32" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;

  # Fix wrong path in pc file
  perl-32 -pi -e "s, -L${srcdir}/?\S+,,g" "${pkgdir}"/usr/lib32/qt/pkgconfig/Qt5WebKit.pc

  rm -rf "${pkgdir}"/{etc,usr/{share,include,bin}}
}


package_lib32-qt5-wayland() {
  pkgdesc='Provides APIs for Wayland'
  depends=(lib32-{qt5-base,lib{xcomposite,xkbcommon}})
  provides=('lib32-qt5-wayland'=$pkgver)
  conflicts=('lib32-qt5-wayland')

  cd ${_pkgfqn}/qtwayland
  make INSTALL_ROOT="${pkgdir}" install

  # Fix wrong path in prl files
  find "${pkgdir}/usr/lib32" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;

  rm -rf "${pkgdir}"/{etc,usr/{share,include,bin}}

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}

package_lib32-qt5-webchannel() {
  pkgdesc='Provides access to QObject or QML objects from HTML clients for seamless integration of Qt applications with HTML/JavaScript clients'
  depends=('lib32-qt5-declarative')
  provides=('lib32-qt5-webchannel'=$pkgver)
  conflicts=('lib32-qt5-webchannel')

  cd ${_pkgfqn}/qtwebchannel
  make INSTALL_ROOT="${pkgdir}" install

  # Fix wrong path in prl files
  find "${pkgdir}/usr/lib32" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;

  rm -rf "${pkgdir}"/{etc,usr/{share,include,bin}}

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}

package_lib32-qt5-webengine() {
  pkgdesc='Provides support for web applications using the Chromium browser project'
  depends=(lib32-{qt5-declarative,nss,alsa-lib,lib{xtst,xcursor,xrandr,xcomposite}})
  provides=('lib32-qt5-webengine'=$pkgver)
  conflicts=('lib32-qt5-webengine')
  license=('LGPL')

  cd ${_pkgfqn}/qtwebengine
  make INSTALL_ROOT="${pkgdir}" install

  #rm -rf "${pkgdir}"/usr/share/doc

  rm -rf "${pkgdir}"/{etc,usr/{share,include,bin}}
}

package_lib32-qt5-websockets() {
  pkgdesc='Provides WebSocket communication compliant with RFC 6455'
  depends=('lib32-qt5-declarative')
  provides=('lib32-qt5-websockets'=$pkgver)
  conflicts=('lib32-qt5-websockets')
  license=('LGPL')

  cd ${_pkgfqn}/qtwebsockets
  make INSTALL_ROOT="${pkgdir}" install

  # Fix wrong path in prl files
  find "${pkgdir}/usr/lib32" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;

  rm -rf "${pkgdir}"/{etc,usr/{share,include,bin}}
}

package_lib32-qt5-x11extras() {
  pkgdesc='Provides platform-specific APIs for X11 (32bit)'
  depends=('lib32-qt5-base')
  provides=('lib32-qt5-x11extras'=$pkgver)
  conflicts=('lib32-qt5-x11extras')

  cd ${_pkgfqn}/qtx11extras
  make INSTALL_ROOT="${pkgdir}" install

  # Fix wrong path in prl files
  find "${pkgdir}/usr/lib32" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;

  rm -rf "${pkgdir}"/{etc,usr/{share,include,bin}}

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}


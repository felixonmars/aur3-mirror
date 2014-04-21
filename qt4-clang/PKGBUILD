# Maintainer: damkrat <akm47c@gmail.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=qt4-clang
pkgver=4.8.6
pkgrel=1
arch=('i686' 'x86_64')
url='http://qt-project.org/'
license=('GPL3' 'LGPL' 'FDL' 'custom')
pkgdesc='A cross-platform application and UI framework (Built with clang and libc++)'
provides=('qt4-clang')
depends=('libtiff' 'libpng' 'sqlite' 'sqlite2' 'ca-certificates' 'dbus'
         'fontconfig' 'libgl' 'libxrandr' 'libxv' 'libxi' 'alsa-lib' 'clang' 'libc++'
         'libc++abi' 'xdg-utils' 'hicolor-icon-theme' 'desktop-file-utils' 'libmng')
makedepends=('postgresql-libs' 'mariadb' 'unixodbc' 'cups' 'gtk2' 'libfbclient'
             'mesa')
optdepends=('qtchooser: set the default Qt toolkit'
            'postgresql-libs: PostgreSQL driver'
            'libmariadbclient: MariaDB driver'
            'unixodbc: ODBC driver'
            'libfbclient: Firebird/iBase driver'
            'libxinerama: Xinerama support'
            'libxcursor: Xcursor support'
            'libxfixes: Xfixes support'
            'icu: Unicode support')

install="${pkgname}.install"
options=('staticlibs') # libQtUiTools builds as static only
source=('git+git://gitorious.org/qt/qt.git'
        'qmake.conf'
        'qplatformdefs.h'
        'clang.conf'
        'gcc-base.conf'
        'gcc-base-unix.conf'
        'linux.conf'
        'unix.conf'
        'assistant-qt4-clang.desktop'
        'designer-qt4-clang.desktop'
        'linguist-qt4-clang.desktop'
        'qdbusviewer-qt4-clang.desktop'
        'qtconfig-qt4-clang.desktop'
        'qt5-backport-qsharedpointer.patch')
md5sums=('SKIP'
         'cd6f2bfb652f78ff357e056976039216'
         'f853b8e23637c6dad8c8bcba7b697fdd'
         '333ba738ff2d73cb197ec8bb381cac3b'
         '0e79d315fa6a94d63215c3f0dea5f443'
         '4cdbec0a2c0383665a7c1f6ea4b13aea'
         '83cd0f324214bf4f4052ec18c26fb01d'
         '56550f2d009d4947010ac6fedcbb8173'
         'c57e13bc411090702290669e6707a975'
         '99b882bb2912858a0487dbc33b4ca593'
         '7d0537dd9426a15264a8fee1aa1b3b72'
         '587fea9f31fe48a62f11d1437d3ec547'
         '2c88af3d7d77df09e4b8f33c7ce6891d'
         'da17fcb22b23e091a45abd24d9d58d8f')

_mkspec=linux-clang
_prefix=/opt/qt4-clang

prepare() {

  cd $srcdir/

  mkdir qt/mkspecs/$_mkspec
  cp qmake.conf qplatformdefs.h clang.conf gcc-base.conf gcc-base-unix.conf linux.conf unix.conf qt/mkspecs/$_mkspec

  cd qt

  patch -p1 -i "${srcdir}"/qt5-backport-qsharedpointer.patch


  ./configure -confirm-license -opensource -platform $_mkspec \
    -prefix $_prefix \
    -bindir $_prefix/bin \
    -headerdir $_prefix/include \
    -docdir $_prefix/doc/ \
    -plugindir $_prefix/plugins \
    -importdir $_prefix/imports \
    -datadir $_prefix/share \
    -largefile \
    -shared \
    -fast \
    -silent \
    -reduce-relocations \
    -no-rpath \
    -optimized-qmake \
    -xmlpatterns \
    -multimedia \
    -audio-backend \
    -svg \
    -script \
    -scripttools \
    -javascript-jit \
    -webkit \
    -declarative \
    -declarative-debug \
    -gtkstyle \
    -iconv \
    -glib \
    -no-qt3support \
    -no-phonon \
    -no-phonon-backend \
    -no-egl \
    -no-gstreamer \
    -no-openvg \
    -graphicssystem opengl \
    -opengl desktop \
    -system-zlib \
    -system-libtiff \
    -system-libpng \
    -system-libmng \
    -system-libjpeg \
    -system-sqlite \
    -plugin-sql-{psql,mysql,sqlite,sqlite2,odbc,ibase} \
    -nomake demos \
    -nomake examples \
    -make docs \
    -make translations \
    -make tools \
    -openssl-linked \
    -dbus-linked


}

build() {

  cd $srcdir/qt

  x=$(nproc); x=$(($x+1))
  make -j$x && make docs
}

package() {
  cd $srcdir/qt
  make INSTALL_ROOT="${pkgdir}" install

  # install missing icons and desktop files
  install -D -m644 src/gui/dialogs/images/qtlogo-64.png \
    "${pkgdir}"/usr/share/icons/hicolor/64x64/apps/qt4logo-clang.png
  install -D -m644 tools/assistant/tools/assistant/images/assistant.png \
    "${pkgdir}"/usr/share/icons/hicolor/32x32/apps/assistant-qt4-clang.png
  install -D -m644 tools/assistant/tools/assistant/images/assistant-128.png \
    "${pkgdir}"/usr/share/icons/hicolor/128x128/apps/assistant-qt4-clang.png
  install -D -m644 tools/designer/src/designer/images/designer.png \
    "${pkgdir}"/usr/share/icons/hicolor/128x128/apps/designer-qt4-clang.png
  for icon in tools/linguist/linguist/images/icons/linguist-*-32.png ; do
    size=$(echo $(basename ${icon}) | cut -d- -f2)
    install -D -m644 ${icon} \
        "${pkgdir}"/usr/share/icons/hicolor/${size}x${size}/apps/linguist-qt4-clang.png
  done
  install -D -m644 tools/qdbus/qdbusviewer/images/qdbusviewer.png \
    "${pkgdir}"/usr/share/icons/hicolor/32x32/apps/qdbusviewer-qt4-clang.png
  install -D -m644 tools/qdbus/qdbusviewer/images/qdbusviewer-128.png \
    "${pkgdir}"/usr/share/icons/hicolor/128x128/apps/qdbusviewer-qt4-clang.png

  install -d "${pkgdir}"/usr/share/applications
  install -m644 "${srcdir}"/{assistant,designer,linguist,qtconfig,qdbusviewer}-qt4-clang.desktop \
    "${pkgdir}"/usr/share/applications/

  # Useful symlinks for cmake and configure scripts
  install -d "${pkgdir}"/usr/bin
  for b in "${pkgdir}${_prefix}"/bin/*; do
    ln -s "${_prefix}"/bin/$(basename $b) "${pkgdir}"/usr/bin/$(basename $b)-qt4-clang
  done

  # install license addition
  install -D -m644 LGPL_EXCEPTION.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt

  # Fix wrong libs path in pkgconfig files
  find "${pkgdir}${_prefix}/lib/pkgconfig" -type f -name '*.pc' \
    -exec perl -pi -e "s, -L${srcdir}/?\S+,,g" {} \;

  # Fix wrong bins path in pkgconfig files
  find "${pkgdir}${_prefix}/lib/pkgconfig" -type f -name '*.pc' \
    -exec sed -i 's|/usr/bin/|"${_prefix}"/bin/|g' {} \;

  # Fix wrong path in prl files
  find "${pkgdir}${_prefix}/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;

  # The TGA plugin is broken (FS#33568)
  rm "${pkgdir}${_prefix}"/plugins/imageformats/libqtga.so
}

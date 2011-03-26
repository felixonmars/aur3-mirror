# $Id$
# Contributor: friesoft <friesoft@gmail.com>
# This package provides the master branch of Qt

pkgname=qt-git
pkgver=20100826
pkgrel=2
pkgdesc="The C++ Qt GUI framework - current development snapshot (master branch)"
arch=('i686' 'x86_64')
url="http://www.qtsoftware.com"
license=('GPL3' 'LGPL')

depends=('libpng' 'mesa' 'fontconfig' 'libtiff' 'libmng' 'sqlite3' 'libxrandr' 'glib2' 'libxi' 'dbus' 'libxcursor' 'libxinerama' 'libxrender' 'ca-certificates')
optdepends=('postgresql-libs' 'libmysqlclient' 'unixodbc')
makedepends=('inputproto' 'postgresql-libs' 'mysql' 'unixodbc' 'cups' 'libxfixes' 'gtk2')
provides=('qt' 'qt4' 'qt-doc' 'qt=4.7.0' 'qt4=4.7.0')
replaces=('qt' 'qt4' 'qt-doc' 'qt4-git' 'qt4-doc')
conflicts=('qt' 'qt4' 'qt-doc' 'qt4-git' 'qt4-doc')
options=('!libtool' 'docs')

# desktop files and qdoc3 patch -- needed for qtdesigner-git build
source=('assistant.desktop' 'designer.desktop' 'linguist.desktop' 'qtconfig.desktop')

md5sums=('83d1fd8da6a350dc1f1459d0c8cd226b'
         'bb1afccb14bcad7e7dac826612f5dc9c'
         '038d7083823c2600c97239fe088b2f4b'
         '8618e4b1875143fab8ad244688b2aae7')

_gitroot="git://gitorious.org/qt/qt.git"
_gitname="qt"

build() {
          msg "Connecting to git server...."

          if [ -d ${srcdir}/$_gitname ] ; then
                    cd $_gitname
                    git reset --hard HEAD
                    git pull origin 

                    msg "The local files have been updated to the current revision"

                    cd $srcdir/$_gitname
          else
                    git clone $_gitroot

                    cd $srcdir/$_gitname

                    sed -i "s|-O2|$CXXFLAGS|" mkspecs/common/g++.conf
                    sed -i "/^QMAKE_RPATH/s| -Wl,-rpath,||g" mkspecs/common/g++.conf
                    sed -i "/^QMAKE_LFLAGS\s/s|+=|+= $LDFLAGS|g" mkspecs/common/g++.conf
          fi

          unset QMAKESPEC
          export QT4DIR=$srcdir/$_gitname
          export PATH=${QT4DIR}/bin:${PATH}
          export LD_LIBRARY_PATH=${QT4DIR}/lib:${LD_LIBRARY_PATH}

          ./configure -confirm-license -opensource  -v \
                    -prefix /usr \
                    -sysconfdir /etc \
                    -plugindir /usr/lib/qt/plugins \
                    -translationdir /usr/share/qt/translations \
                    -datadir /usr/share/qt \
                    -docdir /usr/share/doc/qt \
                    -examplesdir /usr/share/doc/qt/examples \
                    -demosdir /usr/share/doc/qt/demos \
                    -largefile \
                    -plugin-sql-{psql,mysql,sqlite,odbc} \
                    -system-sqlite \
                    -xmlpatterns \
                    -no-phonon \
                    -no-phonon-backend \
                    -svg \
                    -webkit \
                    -scripttools \
                    -system-zlib \
                    -system-libtiff \
                    -system-libpng \
                    -system-libmng \
                    -system-libjpeg \
                    -openssl-linked \
                    -dbus-linked \
                    -no-rpath \
                    -silent \
                    -optimized-qmake \
                    -dbus \
                    -no-separate-debug-info \
                    -reduce-relocations \
                    -gtkstyle \
                    -opengl \
                    -glib \
                    -cups \
                    -no-iconv \
                    -xinerama \
                    -xcursor \
                    -xfixes \
                    -qdbus

          # build qt master
          make || return 1
          make docs
}

package() {
          cd $srcdir/$_gitname

          #install everything
          make INSTALL_ROOT=$pkgdir install

          # install missing icons and desktop files
          for icon in tools/linguist/linguist/images/icons/linguist-*-32.png ; do
                  size=$(echo $(basename ${icon}) | cut -d- -f2)
                  install -p -D -m644 ${icon} ${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/linguist.png
          done
          install -p -D -m644 src/gui/dialogs/images/qtlogo-64.png ${pkgdir}/usr/share/icons/hicolor/64x64/apps/qtlogo.png
          install -p -D -m644 tools/assistant/tools/assistant/images/assistant.png ${pkgdir}/usr/share/icons/hicolor/32x32/apps/assistant.png
          install -p -D -m644 tools/designer/src/designer/images/designer.png ${pkgdir}/usr/share/icons/hicolor/128x128/apps/designer.png
          install -d ${pkgdir}/usr/share/applications
          install -m644 ${srcdir}/{linguist,designer,assistant,qtconfig}.desktop ${pkgdir}/usr/share/applications/

          # install license addition
          install -D -m644 LGPL_EXCEPTION.txt ${pkgdir}/usr/share/licenses/qt/LGPL_EXCEPTION.txt

          # Fix wrong path in pkgconfig files
          find ${pkgdir}/usr/lib/pkgconfig -type f -name '*.pc' \
                  -exec perl -pi -e "s, -L${srcdir}/?\S+,,g" {} \;
          # Fix wrong path in prl files
          find ${pkgdir}/usr/lib -type f -name '*.prl' \
                  -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d;s/\(QMAKE_PRL_LIBS =\).*/\1/' {} \;

          # install doc
          install -d ${pkgdir}/usr/share/doc/qt
          cp -r doc/* ${pkgdir}/usr/share/doc/qt
}

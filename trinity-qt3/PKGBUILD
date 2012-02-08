# Maintainer: Pawel 'l0ner' Soltys <pwslts@gmail.com>
# Contributor: Calvin Morrison <MutantTurkey@gmail.com>

pkgname=trinity-qt3
pkgver=3.8.8.d
pkgrel=6
pkgdesc="The Qt3 gui toolkit - with Trinity upstream"
arch=('i686' 'x86_64')
url="http://trinitydesktop.org"
license=('GPL')
groups=('trinity-base')
depends=('libpng' 'libjpeg' 'libxmu' 'libmng' 'postgresql-libs'
         'libxcursor' 'libxinerama' 'mesa' 'libxft' 'libxrandr'
         'libmysqlclient')
makedepends=('libxi' 'postgresql' 'unixodbc' 'libcups')
             #'mysql' 'postgresql' 'sqlite3' 'unixodbc' 'libxi' 'cups')
             # cups - add for cups support
             # cups is enabled by default in ./configure
             # remove -no-cups if you want cups support in qt3
optdepends=('cups: The CUPS Printing System - for printing support'
            'postgresql: A sophisticated object-relational DBMS - databse support'
            'unixodbc: ODBC API for linux - databse support'
            'mysql: A fast SQL database server - databse support')
             #'libmysqlclient' 'postgresql-libs' 'unixodbc' 'cups')
provides=('qt3' 'qt3-enhanced')
replaces=('qt3-enhanced' 'qt3')
options=('libtool' '!emptydirs')
install='qt3.install'
source=('http://mirror.ets.kth.se/trinity/releases/3.5.13/dependencies/qt3-3.3.8.d.tar.gz' 
        'qt-patches.tar.bz2')
md5sums=('78dc675e84aed595375449818cbb589a'
         '71d5f647da82d2a6f5e0e13549f1e865')

_prefix="/opt/qt3"

build() {
   cd $srcdir/qt3

   msg "Patching source code..."
   # apply qt patches from debian/gentoo and kde
   for patch in $srcdir/qt-patches/*.patch; do
      _p=`basename $patch`
      msg "Applying patch $_p.."
      patch -Np0 -i $patch
   done
   unset _p patch

   # Originally this was done in a patch but probably it's a bad idea
   # Besides we need the rpath, since we don't install qt in the default
   # system dirs. If we would install into default /usr hierarchy
   # we would uncomment this. See Beyond Linux From Scratch book
   # for more info.
   # sed -i '/QMAKE_RPATH/d' mkspecs/linux*/qmake.conf

   # These are probably arch-specific. They were present in old qt3 
   # PKGBULD, they were present in kdemod3 PKGBUILD, they are present
   # here.
   sed -i 's|-cp -P -f|-cp -L -f|' qmake/Makefile.unix
   sed -i "s|-O2|$CXXFLAGS|" mkspecs/linux-g++/qmake.conf
   sed -i "s|-O2|$CXXFLAGS|" mkspecs/linux-g++-32/qmake.conf
   sed -i "s|-O2|$CXXFLAGS|" mkspecs/linux-g++-64/qmake.conf
   sed -i "s|-I. |$CXXFLAGS -I. |" qmake/Makefile.unix

   # auto license acceptance
   sed -i "s|read acceptance|acceptance=yes|" configure

   msg "Setting enviroment variables..."
   export QTDIR="${srcdir}/qt3/" 
   export PATH=${QTDIR}/bin:${PATH}
   export LD_LIBRARY_PATH=${QTDIR}/lib:${LD_LIBRARY_PATH}
   export QMAKESPEC=$QTDIR/mkspecs/linux-g++

   if [ "$CARCH" = "x86_64" ]; then
      export ARCH="-64"
   else unset ARCH
   fi
   
   # Remove useless to us mkspecs
   rm -rf mkspecs/{*aix*,*bsd*,cygwin*,dgux*,darwin*,hpux*,hurd*,irix*,lynxos*,macx*,qnx*,reliant*,sco*,solaris*,tru64*,unixware*,win32*}

   msg "Starting configure..."
   ./configure \
      -prefix ${_prefix} \
      -sysconfdir /etc/qt \
      -I/usr/include/mysql \
      -I/usr/include/postgresql/server \
      -lpq \
      -lmysqlclient \
      -L/usr/lib/mysql \
      -qt-gif \
      -system-zlib \
      -system-libpng \
      -system-libjpeg \
      -system-libmng \
      -plugin-imgfmt-png \
      -plugin-imgfmt-jpeg \
      -plugin-imgfmt-mng \
      -plugin-sql-mysql \
      -plugin-sql-psql \
      -plugin-sql-sqlite \
      -plugin-sql-odbc \
      -platform linux-g++${ARCH} \
      -no-exceptions \
      -thread \
      -dlopen-opengl \
      -no-ipv6

   # 64bit fixes pulled from extras/qt3 PKGBUILD
   # this is Arch-specific
   # fix /opt/qt/lib path
   [ "$CARCH" = "x86_64" ] && sed -i "s|/opt/qt/lib64|/opt/qt/lib|g" "${srcdir}"/qt3/src/Makefile
   [ "$CARCH" = "x86_64" ] && sed -i "s|/opt/qt/lib64|/opt/qt/lib|g" "${srcdir}"/qt3/tools/designer/designer/Makefile
   [ "$CARCH" = "x86_64" ] && sed -i "s|/opt/qt/lib64|/opt/qt/lib|g" "${srcdir}"/qt3/tools/designer/editor/Makefile
   [ "$CARCH" = "x86_64" ] && sed -i "s|/opt/qt/lib64|/opt/qt/lib|g" "${srcdir}"/qt3/tools/assistant/lib/Makefile
   [ "$CARCH" = "x86_64" ] && sed -i "s|/opt/qt/lib64|/opt/qt/lib|g" "${srcdir}"/qt3/tools/designer/uilib/Makefile

   msg "Building - $pkgname..."

   # build sql plugins
   # do we need this, I don't think so.
   #cd "${srcdir}"/qt3
   #make -C qmake
   #cd "${srcdir}"/qt3/plugins/src/sqldrivers/mysql
   #"${srcdir}"/qt3/bin/qmake -o Makefile "INCPATH+=/usr/include/mysql" "LIBS+=-L/usr/lib/mysql -lmysqlclient" mysql.pro
   #cd "${srcdir}"/qt3/plugins/src/sqldrivers/psql
   #"${srcdir}"/qt3/bin/qmake -o Makefile "INCPATH+=/usr/src/include /usr/include/postgresql/server" "LIBS+=-L/usr/lib -lpq" psql.pro

   cd "${srcdir}"/qt3

   # build rest, but without tutorials and examples
   # of you want them, remove sub-tools
   make sub-tools

}

package() {
   msg "Packaging - $pkgname-$pkgver"
   cd "$srcdir/qt3"

   make INSTALL_ROOT="$pkgdir" install

   # install qmake
   install -D -m755 qmake/qmake "${pkgdir}"$_prefix/bin/qmake

   # install doc pages which are missed by make install
   install -d -m755 "${pkgdir}"$_prefix/doc/
   cp -r "${srcdir}"/qt3/doc "${pkgdir}"$_prefix/doc

   # install link the apps provided by qt3 so we don't collide with
   # qt4 and can run them.
   ln -sf $_prefix/bin/assistant "${pkgdir}"$_prefix/bin/qt3assistant
   ln -sf $_prefix/bin/designer "${pkgdir}"$_prefix/bin/qt3designer
   ln -sf $_prefix/bin/linguist "${pkgdir}"$_prefix/bin/qt3linguist
   ln -sf $_prefix/bin/lrelease "${pkgdir}"$_prefix/bin/qt3lrelease
   ln -sf $_prefix/bin/lupdate "${pkgdir}"$_prefix/bin/qt3lupdate
   ln -sf $_prefix/bin/moc "${pkgdir}"$_prefix/bin/qt3moc
   ln -sf $_prefix/bin/qmake "${pkgdir}"$_prefix/bin/qt3qmake
   ln -sf $_prefix/bin/qtconfig "${pkgdir}"$_prefix/bin/qt3config

   # Build ld.so.conf file
   install -d -m755 ${pkgdir}/etc/ld.so.conf.d/
   echo "${_prefix}/lib" >> ${pkgdir}/etc/ld.so.conf.d/qt3.conf

   # Build and install qt.profile
   install -d -m755 ${pkgdir}/etc/profile.d/
   echo "export QTDIR=${_prefix}" > ${pkgdir}/etc/profile.d/qt3.sh
   echo "export QT_XFT=true" >> ${pkgdir}/etc/profile.d/qt3.sh
   echo "export PATH+=:${_prefix}/bin" >> ${pkgdir}/etc/profile.d/qt3.sh
   echo "export PKG_CONFIG_PATH+=:${_prefix}/pkgconfig" >> ${pkgdir}/etc/profile.d/qt3.sh

   msg "Cleaning package..."

   #rm -rf "${pkgdir}"$_prefix/{phrasebooks,templates,translations}
   
   # remove any link to the compiled libraries present in
   # $srcdir, which won't be present in non-building system.
   sed -i "s|-L${srcdir}/qt3/lib ||g" "${pkgdir}"$_prefix/lib/*.prl

   #rm -f "${pkgdir}"${_prefix}/mkspecs/linux-g++$ARCH/linux-g++$ARCH

   # Fix issues with GCC4
   sed -i 's/\(char\*\)/const char*/g' $pkgdir$_prefix/include/*.h
   # Fix the mess we did fixing issues with GCC4
   sed -i 's/const u char/const uchar/g' $pkgdir$_prefix/include/*.h
   sed -i 's/u const char/const uchar/g' $pkgdir$_prefix/include/*.h
   sed -i 's/const const/const/g' $pkgdir$_prefix/include/*.h
   sed -i 's/uconst/ unsigned /g' $pkgdir$_prefix/include/*.h

   # missing include "qglobal.h" in include/qtimer.h fix
   sed -ie 's/define QTIMER_H/&\n#include "qglobal.h"/g' $pkgdir$_prefix/include/qtimer.h

} 

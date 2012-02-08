# Maintainer: Pawel 'l0ner' Soltys <pwslts@gmail.com>
# Contributor: Calvin Morrison <mutantturkey@gmail.com>

pkgname=trinity-tqtinterface
pkgver=3513
pkgrel=4
arch=('i686' 'x86_64')
url="http://trinity.pearsoncomputing.net"
license=('GPL2')
groups=('trinity-base')
pkgdesc="Trinity - TQt interface"
depends=('trinity-qt3')
makedepends=('pkgconfig' 'cmake')
conflicts=('kdemod3-tqtinterface')
makeopts=('libtool' '!emptydirs')
source=('http://mirror.ets.kth.se/trinity/releases/3.5.13/dependencies/tqtinterface-3.5.13.tar.gz'
        'tqtpc-location.patch' 'trinity.profile.sh' 'trinity.profile.csh')
md5sums=('d54cc9fd0b35555298efd17c32471a2b'
         'c15745c944d98cb7c4cb553f0ca421d4'
         '72c6c4fb492c1f4b4741fad1dd70d62f'
         '915e14c6264a6b9c46a6a20b16cdcd06')
install='trinity-tqtinterface.install'

build() {
   msg "Setting PATH, CMAKE and Trinity Environment variables"
   # Source the QT and KDE profile
   [ "$QTDIR" = "" ] && . /etc/profile.d/qt3.sh 

   cd $srcdir
   msg "Creating out-of-source build directory: ${srcdir}/build"
   mkdir -p build
   cd build

   msg "Starting cmake..."
   cmake "../dependencies/tqtinterface" \
     -DCMAKE_INSTALL_PREFIX=/opt/trinity \
     -DQT_PREFIX_DIR=${QTDIR} \
     -DQT_INCLUDE_DIR=${QTDIR}/include \
     -DMOC_EXECUTABLE=${QTDIR}/bin/moc \
     -DQT_VERSION=3
#     -DQT_INCLUDE_DIR=${QTDIR}/include/tqt/Qt
#     -DQT_LIBRARY_DIRS=/opt/qt/lib \
#     -DCMAKE_SKIP_RPATH=ON || return 1

   make
}

package() {
   msg "Packaging - $pkgname-$pkgver"
   cd ${srcdir}/build
   make DESTDIR="${pkgdir}" install

   # include uic-tqt in package
   #cd ${srcdir}
   #mkdir -p ${pkgdir}/usr/bin
   #cp -Rp ${srcdir}/${_svnmod}/qtinterface/uic-tqt ${pkgdir}/usr/bin

   # it should contain sripts which would add
   # their location into system variables
   # this mean that this package should provide
   # /etc/ld.so.conf.d/trinity.conf - lib locations for linker
   # /etc/profile.d/trinity.sh - $PATH and other system variables for bash
   # /etc/profile.d/trinity.csh - $PATH and other system variables for csh
   # up until now it was done in the kdelibs PKGBUILD/package

   # Create and install ld.so.conf.d file
   install -d -m755 $pkgdir/etc/ld.so.conf.d/
   echo /opt/trinity/lib > $pkgdir/etc/ld.so.conf.d/trinity.conf
   echo /opt/trinity/lib/trinity >> $pkgdir/etc/ld.so.conf.d/trinity.conf

   # Install profiles
   install -D -m755 $srcdir/trinity.profile.sh $pkgdir/etc/profile.d/trinity.sh
   install -D -m755 $srcdir/trinity.profile.csh $pkgdir/etc/profile.d/trinity.csh

}

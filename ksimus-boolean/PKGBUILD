# Contributor: thorsten w. <p@thorsten-wissmann.de>
pkgname=ksimus-boolean
pkgver=0.3.6
pkgrel=1
pkgdesc="Boolean Functions for KSimus"
arch=('i686' 'x86_64')
url="http://ksimus.berlios.de/"
license=('GPL')
depends=('ksimus')
makedepends=( )
backup=( )
         #fix-gcc44-static-template.patch
source=( ftp://ftp.berlios.de/pub/ksimus/kde3/ksimus-boolean-3-0.3.6.tar.gz
         configure-disable-arts.patch 
         )

md5sums=( ae3db75b13a947c8ebcc952326893f83
          0bc7a40304d6e178684afc16fc1e314f
         )

build() {
  # patching configure file to disable arts
  patch $srcdir/ksimus-boolean-$pkgver/configure configure-disable-arts.patch
  cd $srcdir/ksimus-boolean-$pkgver || return 1
  #patch -p1 < $srcdir/fix-gcc44-static-template.patch || return 1
  #CONFIGOPTIONS=(
  #      --prefix=/opt
  #      --with-qt-dir=/opt/qt
  #       --with-qt-includes=/opt/qt/include/
  #)
  #./configure  ${CONFIGOPTIONS[@]} || return 1

  # disable kdelibsuff the hard way
  sed -i 's,\<kdelibsuff=.*$,\<kdelibsuff=,' configure
  export CXXFLAGS="$CXXFLAGS -fPIC"
  # taking some config-params from klogic
  ./configure --without-arts                            \
              --prefix=/opt/kde/                        \
              --with-qt-dir=/usr/                       \
              --with-qt-includes=/usr/include/qt3/      \
              --with-qt-libraries=/usr/lib/qt3/         \
              --with-extra-includes=/opt/kde/include/   \
              --with-extra-libs=/opt/kde/lib/           \
              --disable-libsuffix                       \
              --with-pic                                \
              --with-gnu-ld

  make MOC=moc-qt3 UIC=uic-qt3
}

package() {
  cd $srcdir/$pkgname-$pkgver
  # exec-prefix is different, when installing
  make DESTDIR=$pkgdir exec_prefix=${pkgdir}/opt/kde install
}

# Contributor: thorsten w. <p@thorsten-wissmann.de>
pkgname=ksimus
pkgver=0.3.6
pkgrel=3
pkgdesc="KDE3 tool for simulation, automatization and visualization of technical processes."
arch=('i686' 'x86_64')
url="http://ksimus.berlios.de/"
license=('GPL')
depends=('kdelibs3')
makedepends=( )
backup=( )
source=( ftp://ftp.berlios.de/pub/ksimus/kde3/ksimus-3-$pkgver-2.tar.gz 
         configure-disable-arts.patch 
         fix-gcc44-static-template.patch
         )

md5sums=('d990a4a71531c54229decef302358bd0'
         '0bc7a40304d6e178684afc16fc1e314f'
         '1eb234f921e77bbcfa1fcccc2389a2ad'
        )

build() {
  # patching configure file to disable arts
  patch $srcdir/ksimus-$pkgver/configure configure-disable-arts.patch
  cd $srcdir/ksimus-$pkgver || return 1
  patch -p1 < $srcdir/fix-gcc44-static-template.patch || return 1
  #CONFIGOPTIONS=(
  #      --prefix=/opt
  #      --with-qt-dir=/opt/qt
  #       --with-qt-includes=/opt/qt/include/
  #)
  #./configure  ${CONFIGOPTIONS[@]} || return 1
  # taking some config-params from klogic
      # disable kdelibsuff the hard way
      sed -i 's,\<kdelibsuff=.*$,\<kdelibsuff=,' configure
      ./configure --without-arts                            \
                  --prefix=/opt/kde/                        \
                  --with-qt-dir=/usr/                       \
                  --with-qt-includes=/usr/include/qt3/      \
                  --with-qt-libraries=/usr/lib/qt3/         \
                  --with-extra-includes=/opt/kde/include/   \
                  --with-extra-libs=/opt/kde/lib/           \
                  --disable-libsuffix                       \
                  --with-gnu-ld

  make MOC=moc-qt3 UIC=uic-qt3

}

package() {
  cd $srcdir/ksimus-$pkgver
  make DESTDIR=$pkgdir install
}


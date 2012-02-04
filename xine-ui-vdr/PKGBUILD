# Maintainer: Franz Burgmann <f dot burgmann at gmail dot com>

pkgname=xine-ui-vdr
pkgver=0.99.5
pkgrel=4
pkgdesc="xine-ui with VDR keys enabled."
arch=('i686' 'x86_64')
license=('GPL')
url="http://xinehq.de/"
depends=('xine-lib-vdr' 'curl>=7.16.2' 'libxtst' 'libxinerama' 'libxv' 'libpng' 'libxft' 'libsm' 'libxxf86vm' 'ncurses>=5.6-7')
makedepends=('lirc' 'libxt')
optdepends=('lirc')
provides=('xine-ui')
conflicts=('xine-ui')
options=('!emptydirs')
source=(http://downloads.sourceforge.net/sourceforge/xine/xine-ui-${pkgver}.tar.gz)
md5sums=('e643cd1fcad4d98a5ae4eb877ce5087b')

build() {
  cd ${srcdir}/xine-ui-${pkgver}
  
  #add missing constant (defined in xine.h from xine-lib cvs)
  echo '#define XINE_MSG_AUDIO_OUT_UNAVAILABLE 11' >> src/xitk/common.h
  ./configure --prefix=/usr --mandir=/usr/share/man --enable-vdr-keys  \
    --with-curses --with-x --enable-lirc --without-aalib
  make || return 1
  make DESTDIR=${pkgdir} install
  install -d ${pkgdir}/usr/share/applications
  echo "Categories=Application;AudioVideo;" >> ${pkgdir}/usr/share/xine/desktop/xine.desktop
  mv ${pkgdir}/usr/share/xine/desktop/xine.desktop ${pkgdir}/usr/share/applications
}

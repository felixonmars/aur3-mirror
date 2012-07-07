# Maintainer: TheLuda <theluda@getmangos.com>

pkgname=ace60
pkgver=6.0.8
pkgrel=1
pkgdesc="Framework that provides many components and patterns for developing high-performance, distributed real-time and embedded systems."
url="http://www.cs.wustl.edu/~schmidt/ACE.html"
license=('custom')
arch=('i686' 'x86_64')
depends=()
options=(!libtool)
conflicts=('libace')
source=(http://download.dre.vanderbilt.edu/previous_versions/ACE-${pkgver}.tar.gz
        license.txt)

build() {
  export ACE_ROOT=$srcdir/ACE_wrappers
  cd $ACE_ROOT
  echo '#include "ace/config-linux.h"' > ace/config.h
  echo 'INSTALL_PREFIX = /usr
  include $(ACE_ROOT)/include/makeinclude/platform_linux.GNU' > include/makeinclude/platform_macros.GNU
  cd ace
  make || return 1
}
package() {
  cd $srcdir/ACE_wrappers/ace
  make DESTDIR="$pkgdir/" install
}
sha1sums=('e0c767f113b01e302d83f4fe429683967e1d354e'
          'b21054d0aa546fabe4bb0c2769401314d4a5bfe3')

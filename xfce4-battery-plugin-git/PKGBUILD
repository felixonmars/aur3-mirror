# xfce4-battery-plugin-git
# Maintainer: Stephen Jackson <scj7t4@mst.edu>

pkgname=xfce4-battery-plugin-git
pkgver=20110601
pkgrel=1
pkgdesc="A battery monitor plugin for the Xfce panel."
arch=(i686 x86_64)
license=('GPL2')
url="http://xfce-goodies.berlios.de/"
groups=('xfce4-goodies')
depends=('xfce4-panel' 'libxfcegui4' 'hicolor-icon-theme')
conflicts=('xfce4-battery-plugin')
provides=('xfce4-battery-plugin')
makedepends=('intltool')
options=('!libtool')
install=${pkgname}.install
md5sums=()

_gitroot=(git://git.xfce.org/panel-plugins/xfce4-battery-plugin)
_gitname="xfce4-battery-plugin"

build() {
  cd ${srcdir}
  
  if [ -d "$srcdir/$_gitname" ] ; then
    rm -rf $_gitname
  fi 
  git clone ${_gitroot}
  
  cd ${srcdir}/${_gitname}
  ./autogen.sh
  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--libexecdir=/usr/lib \
	--localstatedir=/var \
	--disable-static \
	--disable-debug
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}


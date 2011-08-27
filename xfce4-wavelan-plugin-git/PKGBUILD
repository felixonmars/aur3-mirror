# xfce4-wavelan-plugin-git
# Maintainer: Stephen Jackson <scj7t4@mst.edu>

pkgname=xfce4-wavelan-plugin-git
pkgver=20110601
pkgrel=1
pkgdesc="plugin to monitor wifi connectivity for the Xfce4 panel"
arch=('i686' 'x86_64')
license=('custom')
url="http://goodies.xfce.org/projects/panel-plugins/xfce4-wavelan-plugin/"
groups=('xfce4-goodies')
depends=('xfce4-panel' 'libxfcegui4')
conflicts=('xfce4-wavelan-plugin')
provides=('xfce4-wavelan-plugin')
makedepends=('intltool')
options=('!libtool')

_gitroot=(git://git.xfce.org/panel-plugins/xfce4-wavelan-plugin)
_gitname="xfce4-wavelan-plugin"

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

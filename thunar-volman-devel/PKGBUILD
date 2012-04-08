# Maintainer: Xavier Devlamynck <magicrhesus@ouranos.be>

pkgname=thunar-volman-devel
_realname=${pkgname/-devel/}
pkgver=0.7.0
pkgrel=7
pkgdesc="a freedesktop.org compliant ui implementation for Xfce (Development Version)"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.xfce.org/"
groups=('xfce4-devel')
depends=('exo-devel' 'glib2' 'gtk2' 'udev' 'libxfce4ui-devel' 'libxfce4util-devel' 'xfconf-devel' 'libnotify' 'hicolor-icon-theme')
makedepends=('pkgconfig' 'intltool' 'xfce4-dev-tools')
conflicts=('thunar-volman' 'thunar-volman-git')
replaces=('thunar-volman' 'thunar-volman-git')
options=('!libtool')
source=(http://git.xfce.org/xfce/thunar-volman/snapshot/thunar-volman-${_realname}-${pkgver}.tar.bz2)
md5sums=('a92349ced839df8353c10ef8612207f0 ')
install=thunar-volman-devel.install

build() {
  cd ${srcdir}/${_realname}-${_realname}-${pkgver}

	./autogen.sh 

	./configure \
	--prefix=/usr \
	--sysconfdir=/etc \
	--libexecdir=/usr/lib/xfce4 \
	--localstatedir=/var \
	--disable-static
  make
}

package() {
	cd ${srcdir}/${_realname}-${_realname}-${pkgver}
	make DESTDIR="$pkgdir" install
}

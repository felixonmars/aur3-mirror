# Maintainer: Xavier Devlamynck <magicrhesus@ouranos.be>

pkgname=thunar-archive-plugin-devel
pkgver=0.3.0
pkgrel=1
pkgdesc="Create and deflate archives in Thunar"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://goodies.xfce.org/projects/thunar-plugins/thunar-archive-plugin"
groups=('xfce4-goodies-devel')
depends=('thunar-devel>=1.2.0' 'hicolor-icon-theme')
makedepends=('intltool')
conflicts=('thunar-archive-plugin')
options=('!libtool')
source=(http://archive.xfce.org/src/thunar-plugins/thunar-archive-plugin/0.3/thunar-archive-plugin-${pkgver}.tar.bz2)
md5sums=('afeb3f1c65a4529dbdadc6e7b349a712')

build() {
  cd ${srcdir}/thunar-archive-plugin-${pkgver}
  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--libexecdir=/usr/lib/xfce4 \
	--localstatedir=/var \
	--disable-static
  make
}

package() {
	cd ${srcdir}/thunar-archive-plugin-${pkgver}
	make DESTDIR=${pkgdir} install
}

# Contributor: stalker_exe <stalkerexe8@gmail.com>

pkgname=xfce4-cpugraph-plugin-git
pkgver=20111111
pkgrel=1
pkgdesc="CPU graph plugin for the Xfce4 panel. GIT version"
arch=('i686' 'x86_64')
license=('GPL' 'custom')
url="http://goodies.xfce.org/projects/panel-plugins/xfce4-cpugraph-plugin"
groups=('xfce4-goodies')
depends=('xfce4-panel' 'libxfcegui4' 'hicolor-icon-theme')
makedepends=('intltool' 'xfce4-dev-tools')
install=xfce4-cpugraph-plugin.install
source=(xfce4-cpugraph-plugin.install)
conflicts=(xfce4-cpugraph-plugin)
provides=(xfce4-cpugraph-plugin)
md5sums=('6857cd63e732288422b9c18a912d8564')

build() {
  git clone git://git.xfce.org/panel-plugins/xfce4-cpugraph-plugin
  cd ${srcdir}/xfce4-cpugraph-plugin
  ./autogen.sh
  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--libexecdir=/usr/lib \
	--localstatedir=/var \
	--disable-static \
	--disable-debug
make
}

package() {
  cd ${srcdir}/xfce4-cpugraph-plugin
  make DESTDIR=${pkgdir} install
  install -Dm644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}

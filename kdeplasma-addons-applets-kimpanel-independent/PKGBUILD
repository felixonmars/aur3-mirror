# Maintainer: btstream <btstream@gmail.com>

_pkgbase=kdeplasma-addons
pkgname=('kdeplasma-addons-applets-kimpanel-independent')
pkgver=4.4.0
pkgrel=1
pkgdesc="An independent version of kimpanel, this version provides ibus support."
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('GPL' 'LGPL')
groups=('kde' 'kdeplasma-addons')
depends=('kdebase-workspace>=4.4')
makedepends=('pkgconfig' 'cmake' 'automoc4' 'kdebase-workspace' 'libqalculate'
             'kdegraphics-libs' 'kdeedu-marble' 'eigen' 'qwt' 'scim')
optdepends=('ibus>=1.1.0' 'scim')
provide=('kdeplasma-addons-applets-kimpanel=4.4.0')
conflicts=('kdeplasma-addons-applets-kimpanel', 'kimpanel-plasmoid-svn')
source=("http://download.kde.org/stable/${pkgver}/src/${_pkgbase}-${pkgver}.tar.bz2")
install='kdeplasma-addons-applets-kimpanel-independent.install'

build() {

	cd $srcdir
	mkdir build
	cd build
	cmake ../${_pkgbase}-${pkgver} \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_SKIP_RPATH=ON \
		-DCMAKE_{SHARED,MODULE,EXE}_LINKER_FLAGS='-Wl,--no-undefined -Wl,--as-needed' \
		-DCMAKE_INSTALL_PREFIX=/usr
	make || return 1

	cd $srcdir/build/applets/kimpanel
	make DESTDIR=$pkgdir install

	mkdir -p ${pkgdir}/usr/share/ibus/ui/qt/
	mkdir -p ${pkgdir}/usr/share/ibus/component
	install -m755 $srcdir/$_pkgbase-$pkgver/applets/kimpanel/backend/ibus/panel.py ${pkgdir}/usr/share/ibus/ui/qt/
	install -m644 $srcdir/$_pkgbase-$pkgver/applets/kimpanel/backend/ibus/qtpanel.xml ${pkgdir}/usr/share/ibus/component	
}
md5sums=('0a990a833a8a7c5434d158b0b18c5ad2')

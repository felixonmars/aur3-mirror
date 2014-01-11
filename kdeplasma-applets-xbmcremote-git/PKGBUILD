# Maintainer: Sarwo Hadi Setyana <sh.setyana@gmail.com>

pkgname=kdeplasma-applets-xbmcremote-git
pkgver=r653.c2e83f9
pkgrel=1
pkgdesc="XBMC plasmoid remote control for KDE"
arch=('i686' 'x86_64')
url='https://gitorious.org/xbmcremote'
license=('GPL3')
depends=('kdebase-workspace')
makedepends=('git' 'cmake' 'automoc4')
conflicts=('kdeplasma-applets-xbmcremote')
source=("$pkgname"::'git+https://gitorious.org/xbmcremote/xbmcremote.git')
md5sums=('SKIP')

pkgver() {
	cd $pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	if [ -d build ]; then
		rm -r build
	fi
	
	mkdir -p build
	cd build
	
	cmake ../${pkgname} -DCMAKE_BUILD_TYPE=Release \
    		-DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}

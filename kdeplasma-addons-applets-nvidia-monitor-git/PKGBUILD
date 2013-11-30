
# Maintainer : mdevlamynck <matthias.devlamynck@mailoo.org>

pkgname=kdeplasma-addons-applets-nvidia-monitor-git
_gitname=nvidia-monitor
_gitrepo=https://github.com/mdevlamynck/nvidia-monitor.git
url=https://github.com/mdevlamynck/nvidia-monitor
pkgver=0.1
pkgrel=1
pkgdesc="An applet that monitor nvidia GPU using nvidia-settings (using proprietary drivers). Not supporting SLI and bumblebee yet."

arch=('i686' 'x86_64')
license=('GPL')
depends=('nvidia-utils')
makedepends=('git' 'cmake' 'kdeplasma-addons-libs')
conflicts=('bumblebee')

source=("git+${_gitrepo}")
install=nvidia-monitor.install
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_gitname}
	git tag|sort -V|tail -1|tr "-" "."|sed "s@^v@@"
}

build () {
	cd "${srcdir}/${_gitname}"
	git checkout $(git tag|sort -V|tail -1)
	mkdir -p build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX="${pkgdir}/$(kde4-config --prefix)" -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd "${srcdir}/${_gitname}/build"
	make install
}


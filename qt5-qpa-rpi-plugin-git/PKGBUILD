buildarch=16

pkgname=qt5-qpa-rpi-plugin-git
pkgver=20150222.b57979f
pkgrel=1
pkgdesc="Qt5 eglfs plugin built against Broadcom's GL libs."
url="http://qt.io"
arch=('armv6h' 'armv7h')
license=('GPL3' 'LGPL' 'FDL' 'custom')
depends=('qt5-base' 'mtdev')

_gitroot="git://github.com/greenisland/qt5-qpa-rpi-plugin.git"
_gitbranch=5.4
_gitname=qt5-qpa-rpi-plugin
source=(${_gitname}::${_gitroot}#branch=${_gitbranch})
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_gitname}
	echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

build() {
	cd ${srcdir}/${_gitname}/eglfs_rpi
	qmake
	make
}

package() {
	cd ${srcdir}/${_gitname}/eglfs_rpi
	make INSTALL_ROOT="${pkgdir}" install
}

# Maintainer: Mijo Medvedec <mijo dot medvedec at gmail dot com>

pkgname=papyrus-git
_pkgname=Papyrus
pkgver=1.0.0.stable.r8.gd32d39e
pkgrel=1
pkgdesc="A modern note manager"
arch=('i686' 'x86_64')
url="http://aseman.co/en/products/papyrus/"
license=('GPL3')
conflicts=('papyrus')
provides=('papyrus')
makedepends=('git')
depends=('qt5-base' 'qt5-declarative' 'qt5-location' 'qt5-multimedia' 'qt5-graphicaleffects' 'qt5-quickcontrols')
source=("git+https://github.com/Aseman-Land/Papyrus.git"
	"fix-icons.patch")
md5sums=('SKIP'
	 '439fafafa9dfeb410915fa59a47eae07')
sha256sums=('SKIP'
	    '901f5efae7cde145cd2e17360c81fe226b81c1b6a10accd1790c84d07b30a291')

pkgver() {
	cd ${_pkgname}
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	patch -Np1 -i fix-icons.patch
}

build() {
	cd ${_pkgname}
	
	qmake-qt5 Papyrus.pro
	make
}

package() {
	cd ${_pkgname}
	make INSTALL_ROOT="$pkgdir/" install
}

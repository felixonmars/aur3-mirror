# Maintainer: Mijo Medvedec <mijo dot medvedec at gmail dot com>

pkgname=papyrus
_pkgname=Papyrus
pkgver=1.0.0
pkgrel=2
pkgdesc="A modern note manager"
arch=('i686' 'x86_64')
url="http://aseman.co/en/products/papyrus/"
license=('GPL3')
depends=('qt5-base' 'qt5-declarative' 'qt5-location' 'qt5-multimedia' 'qt5-graphicaleffects' 'qt5-quickcontrols')
source=("http://aseman.co/downloads/${pkgname}/1/${pkgname}-${pkgver}-src.tar.gz"
	"fix-icons.patch")
md5sums=('5a26e31df96a2fde9a7403d76a368e33'
	 '439fafafa9dfeb410915fa59a47eae07')
sha256sums=('f8437e756c60d2e9484e8474fb8794bd0e952f3837e439f80c0470a9886b2e3c'
	    '901f5efae7cde145cd2e17360c81fe226b81c1b6a10accd1790c84d07b30a291')

prepare() {
	patch -p1 < fix-icons.patch
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

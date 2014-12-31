# Maintainer: spider-mario <spidermario@free.fr>
pkgname=soundscape-renderer-git
pkgver=0.4.2.35.gc60c0ab
pkgrel=1
pkgdesc="Tool for real-time spatial audio reproduction providing a variety of rendering algorithms"
arch=('i686' 'x86_64')
url="http://spatialaudio.net/ssr/"
license=('GPL3')
depends=('fftw' 'jack' 'qt4' 'boost-libs' 'libxml2' 'glu' 'ecasound')
makedepends=('git' 'boost' 'help2man')
provides=('soundscape-renderer')
conflicts=('soundscape-renderer')
source=('git+https://github.com/SoundScapeRenderer/ssr.git'
        'moc_qt4.patch')
sha512sums=('SKIP'
            '469a20cef3028d9d85b555746020ac39d8aa322e7a3176af850c43dbaf36f77e8261d76d0e7c565ae95d5cc9d0e89180dc22f42645f04e2fd0d36663f8f6a10f')

pkgver() {
	cd ssr
	git describe | tr - .
}

prepare() {
	cd ssr
	git apply --3way ../moc_qt4.patch
}

build() {
	cd ssr

	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd ssr
	make -k check
}

package() {
	cd ssr
	make DESTDIR="$pkgdir/" install
}

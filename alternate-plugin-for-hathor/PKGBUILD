pkgname="alternate-plugin-for-hathor"
pkgver=34
pkgrel=1
pkgdesc="Enables a certain russian social media network in Hathor. Requires account."
url="http://shdw.x10.mx/hathor"
license=("GPL2")
arch=("i686" "x86_64")
depends=("qt" "qoauth" "liblastfm" "flashplugin" "hathor-svn")
makedepends=("subversion")
source=("src.tar.gz")
md5sums=('7678dd34579c65680cb66fa93e89e5de')

build() {
	tar -xf ./src.tar.gz
	qmake
	make clean
	make -j2

	# install headers
	install -d ${pkgdir}/usr/share/hathor-20120128/plugins
	install -D -m755 "libalternate-plugin-for-hathor.so" "${pkgdir}/usr/share/hathor-20120128/plugins/libalternate-plugin-for-hathor.so"
}

# vim: set noet ff=unix:

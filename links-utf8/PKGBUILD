# Contributor: Kosenko Roman <madkite@gmail.com>
pkgname=links-utf8
pkgver=2.2
pkgrel=1
pkgdesc='Web browser running in both graphics and text mode'
url='http://links.twibright.com'
license=('GPL')
arch=('i686' 'x86_64')
depends=('openssl' 'zlib' 'bzip2' 'gpm' 'libx11' 'freetype2' 'libtiff' 'libpng')
makedepends=('pkgconfig')
source=(${url}/download/${pkgname%-*}-${pkgver}.tar.bz2 \
		${pkgname%-*}-${pkgver}-utf8.diff)
conflicts=('links')
provides=("links=${pkgver}")

build() {
	cd ${startdir}/src/${pkgname%-*}-${pkgver}
	patch -i ../${pkgname%-*}-${pkgver}-utf8.diff -p1 || return 1
	cd Unicode && LANG=C ./gen && cd .. || return 1
	cd intl && ./gen-intl && cd .. || return 1
	cd graphics && ./gen && cd .. || return 1
	./configure --prefix=/usr --enable-javascript --enable-graphics --with-ssl --with-x || return 1
	make || return 1
	make DESTDIR=${startdir}/pkg install || return 1
}

md5sums=('bf5b20529a2a811701c5af52b28ebdd4' '161c5407384a5d7e5558e7aa415713d2')

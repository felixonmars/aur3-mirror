# Maintainer: Madotsuki <madotsuki@cock.li>

pkgname=gtorrent-core
pkgver=20140721
pkgrel=1
pkgdesc="A minimalistic lightweight bittorrent client written by the 4chan technology board. (Core Library)"
arch=('i686' 'x86_64')
url="https://github.com/gtorrent/gtorrent-core"
license=('unknown')
depends=('boost' 'libtorrent-rasterbar')
makedepends=('cmake' 'git')
source=(${pkgname}::git+https://github.com/gtorrent/gtorrent-core)
sha256sums=('SKIP')
provides=(${pkgname})
conflicts=(${pkgname})

pkgver()
{
	cd ${pkgname}
	git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build()
{
	cd ${pkgname}
	mkdir -p build
	cd build
	cmake ..
	make PREFIX=/usr -j`nproc`
}

package()
{
	cd ${pkgname}/build
	make PREFIX=/usr DESTDIR="$pkgdir" install
}


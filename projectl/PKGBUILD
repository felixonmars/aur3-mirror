# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
# Maintainer: matthiaskrgr <matthiaskrgr _strange_curverd_character_ freedroid D0T org>
pkgname=projectl
pkgver=1.001
pkgrel=6
pkgdesc="A ship sword + slash game where you control the sword with your arrow keys."
arch=('i686' 'x86_64')
url="http://hizuoka.web.fc2.com/game/projectL/index_en.html"
license=('custom')
depends=('libgl' 'sdl_mixer')
makedepends=('gdc1-bin')
source=(
	http://ftp.de.debian.org/debian/pool/main/p/projectl/projectl_1.001.dfsg1.orig.tar.gz
	http://ftp.de.debian.org/debian/pool/main/p/projectl/projectl_1.001.dfsg1-3.diff.gz
	changelog)
md5sums=('682c8ce8f8696317384cfe7fa9c4bda0'
         '9d9156a72473275d9d585d111d6c395a'
         '303356c6917ffd3bc28fc7b579eea458')


prepare() {
	cd "$srcdir"/projectL_1001

	patch -p1 <../projectl*diff
	while read x ; do
		patch -p1 <debian/patches/"$x"
	done <debian/patches/series

	sed -i s/gdmd/gdmd1/ Makefile
	sed -i s/gdc/gdc1/ Makefile
	}

build() {
	cd "$srcdir"/projectL_1001
	make
	}

package() {
	cd "$srcdir"/projectL_1001
	sed -i s,\/usr\/games,\/usr\/bin,g "$srcdir"/projectL_1001/debian/projectl.desktop
	install -D -m755 "$srcdir"/projectL_1001/projectl "$pkgdir"/usr/bin/projectl
	install -D -m644 "$srcdir"/projectL_1001/debian/projectl.desktop "$pkgdir"/usr/share/applications/projectl.desktop
	install -D -m644 "$srcdir"/projectL_1001/debian/projectl.xpm "$pkgdir"/usr/share/pixmaps/projectl.xpm
	install -D -m644 "$srcdir"/projectL_1001/debian/copyright "$pkgdir"/usr/share/licenses/projectl/copyright
}

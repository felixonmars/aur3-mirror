# Maintainer: Bogdan Szczurek <thebodzio@gmail.com>

_gitname=diskscan

pkgname=$_gitname-git
pkgver=0.14.1.15.gb73cb8a
pkgrel=1
pkgdesc="CLI tool to scan block devices for unreadable sectors"
arch=('i686' 'x86_64')
url="https://github.com/baruch/diskscan"
license=('GPL3')
depends=('python2-yaml')
makedepends=('redo-git')
install=
source=(git://github.com/baruch/$_gitname.git)
md5sums=(SKIP)

pkgver() {
	cd "$srcdir/$_gitname"

	# Use the tag of the last commit
	git describe --always | sed 's|-|.|g;s|^v||'
}

prepare() {
	cd "$srcdir/$_gitname"

	_files="libscsicmd/include/ata_parse.h.do \
		libscsicmd/smartdb/smartdb_gen.c.do"

	sed -i 's/\(\<python\>\)/\12/' $_files
}

build() {
	cd "$srcdir/$_gitname"
	PYTHON=python2 redo all
}

package() {
	cd "$srcdir/$_gitname"
	DESTDIR="$pkgdir/" redo install
}

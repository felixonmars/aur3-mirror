# Maintainer: Kamil Śliwak <cameel2/at/gmail/com>

pkgname=mdbtools-git
_gitname=mdbtools
pkgver=0.7.146.gdfd752e
pkgrel=3
pkgdesc="A set of libraries and utilities for reading Microsoft Access database (MDB) files."
arch=('i686' 'x86_64')
url="https://github.com/brianb/mdbtools"
depends=('gnome-doc-utils')
makedepends=('git' 'txt2man')
provides=('mdbtools')
conflicts=('mdbtools')
license=('GPL')
source=(
	'git://github.com/brianb/mdbtools.git'
)
md5sums=(
	'SKIP'
)

pkgver() {
	cd $srcdir/$_gitname

	echo $(git describe --always | sed 's|mdbtools-||g' | sed 's|-|.|g')
}

prepare() {
	cd $srcdir/$_gitname

	autoreconf --install --force
	./configure --prefix=/usr
}

build() {
	cd $srcdir/$_gitname

	make
}

package(){
	cd $srcdir/$_gitname

	make DESTDIR="$pkgdir" install
	install -Dm644 src/gmdb2/gmdb.desktop "$pkgdir"/usr/share/applications/gmdb.desktop
}

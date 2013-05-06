# $Id:
# Maintainer: winlu
# Contributor: BlackIkeEagle <ike DOT devolder AT gmail DOT com>

pkgname=shairplay-git
_gitname=shairplay
pkgver=20130429.89202f7
pkgrel=1
pkgdesc='Apple airplay and raop protocol server'
arch=('i686' 'x86_64')
url='https://github.com/juhovh/shairplay'
license=('GPLv3')
depends=('libao')
makedepends=('git')
source=("$_gitname::git://github.com/juhovh/shairplay.git")
sha256sums=('SKIP')
options=(!libtool)
provides=('libshairport')
conflicts=('libshairport')

pkgver() {
	cd "$srcdir/$_gitname"
	echo $(git log -1 --format="%ci" | sed 's/.*\([0-9]\{4\}\)-\([0-9]\{2\}\)-\([0-9]\{2\}\).*/\1\2\3/').$(git rev-parse --short HEAD)
}

build() {
	cd $_gitname
	./autogen.sh
	./configure --prefix=/usr/
	make
}


package() {
	cd $_gitname
	make DESTDIR="$pkgdir" install
}

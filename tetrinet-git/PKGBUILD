# Maintainer: Xavier Mehrenberger xavier.mehrenberger at gmail..com

pkgname=tetrinet-git
pkgver=20110816
pkgrel=2
pkgdesc="Tetrinet client and a simple tetrinet server."
arch=('i686' 'x86_64')
url="http://tetrinet.or.cz/"
license=('Public domain') # Not in arch licenses package, but no other licensing info is present in the tetrinet repo
depends=('ncurses')
makedepends=('git')
source=()
md5sums=()

_gitroot="git://repo.or.cz/tetrinet.git"
_gitname="tetrinet"

build() {
	cd $srcdir

	msg "Connecing to GIT server..."
	if [[ -d $_gitname ]]; then
		(cd $_gitname && git pull origin)
	else
		git clone $_gitroot $_gitname
	fi
	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf $_gitname-build
	cp -r $_gitname $_gitname-build
	cd $_gitname-build

	make || return 1
	mkdir -p ${pkgdir}/usr/bin
	install -m755 $startdir/src/tetrinet-build/tetrinet ${pkgdir}/usr/bin
	install -m755 $startdir/src/tetrinet-build/tetrinet-server ${pkgdir}/usr/bin
}

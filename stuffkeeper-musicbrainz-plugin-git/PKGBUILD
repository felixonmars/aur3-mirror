#Contributor: Rasi <rasi13@gmx.de>

pkgname=stuffkeeper-musicbrainz-plugin-git
provides=stuffkeeper-musicbrainz-plugin
arch=('i686' 'x86_64')
pkgver=20090417
pkgrel=1
pkgdesc="Musicbrainz plugin for stuffkeeper"
source=()
url="http://www.stuffkeeper.org"
license="GPL"
depends=('libmusicbrainz3' 'stuffkeeper-git')
makedepends=('gcc' 'glibc' 'git')
md5sums=()
options=('!libtool')

_gitroot="git://repo.or.cz/stuffkeeper-musicbrainz.git"
_gitname="stuffkeeper-musicbrainz"

build() {
	cd $startdir/src
	msg "Connecting to server..."

	if [ -d $startdir/src/$_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	cp -r $startdir/src/$_gitname $startdir/src/$_gitname-build
	cd $startdir/src/$_gitname-build

	./autogen.sh --prefix=/usr
	make || return 1
	make DESTDIR=$startdir/pkg install

	find $startdir/pkg -type f -name "*.la" -exec rm {} \;
}

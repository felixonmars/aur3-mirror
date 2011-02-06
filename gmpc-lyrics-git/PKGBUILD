#Maintainer: Martin Lee <hellnest.fuah@gmail.com

pkgname=gmpc-lyrics-git
provides=('gmpc-lyrics')
conflicts=('gmpc-lyrics' 'gmpc-lyrics-svn')
pkgver=20110124
pkgrel=1
pkgdesc="A plugin for gmpc that obtains lyrics from a chosen site"
url="http://gmpc.wikia.com/wiki/GMPC_PLUGIN_LYRICS"
license="GPL"
arch=('i686' 'x86_64')
depends=('gmpc-git')
makedepends=('git' 'intltool' 'gob2' 'pkgconfig')
options=('!libtool')
source=()
md5sums=()

_gitroot="git://repo.or.cz/gmpc-lyrics.git"
_gitname="gmpc-lyrics"
build() {
	cd $startdir/src
	msg "Connecting to $_gitroot server..."

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
}

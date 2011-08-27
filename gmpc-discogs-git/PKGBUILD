#Contributor: Mineo <the_mineo@web.de>

pkgname=gmpc-discogs-git
provides=('gmpc-discogs')
conflicts=('gmpc-discogs')
pkgver=20090913
pkgrel=1
pkgdesc="A plugin that fetches cover art and artist images from discoGS"
url="http://gmpc.wikia.com/wiki/GMPC_PLUGIN_DISCOGS"
license="GPL"
arch=('i686' 'x86_64')
depends=('gmpc-git') 
makedepends=('git' 'intltool' 'pkgconfig')
options=('!libtool')

_gitroot="git://repo.or.cz/gmpc-discogs.git"
_gitname="gmpc-discogs"
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


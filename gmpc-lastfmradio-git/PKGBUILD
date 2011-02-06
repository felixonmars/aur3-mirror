#Contributor: DarkJesus <priestoftime@gmail.com>

pkgname=gmpc-lastfmradio-git
provides=gmpc-lastfmradio
conflicts=('gmpc-lastfmradio')
pkgver=20081119
pkgrel=1
pkgdesc="Allows gmpc+mpd to play last.fm radio"
url="http://gmpcwiki.sarine.nl/index.php?title=GMPC_PLUGIN_LASTFMRADIO"
license="GPL"
arch=('i686' 'x86_64')
depends=('gmpc-git' 'gvfs')
makedepends=('git' 'intltool' 'gob2' 'pkgconfig')
options=('!libtool')
source=()
md5sums=()

_gitroot="git://repo.or.cz/gmpc-lastfmradio.git"
_gitname="gmpc-lastfmradio"

build() {
	cd $startdir/src
	msg "Connecting to $_gitroot server..."

	if [ -d $startdir/src/$_gitname ] ; then
		cd $_gitname && git-pull origin
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

#Contributor: Mineo <the_mineo@web.de>

pkgname=gmpc-jamendo-git
provides=gmpc-jamendo
conflicts=('gmpc-jamendo')
pkgver=20091025
pkgrel=1
pkgdesc="The jamendo plugin allows you to browse and preview music available on jamendo."
url="http://gmpc.wikia.com/wiki/GMPC_PLUGIN_JAMENDO"
license="GPL"
arch=('i686' 'x86_64')
depends=('gmpc-git' 'json-glib') 
makedepends=('git' 'intltool' 'pkgconfig')
options=('!libtool')

_gitroot="git://repo.or.cz/gmpc-jamendo.git"
_gitname="gmpc-jamendo"
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


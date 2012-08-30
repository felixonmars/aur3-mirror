#Submitter: Madek <gonzalosegueñ@gmail.com>
#Maintainer: sysrmr <sysrmr qt gmail dot com>


pkgname=gmpc-lyricwiki-git
provides=('gmpc-lyricwiki')
conflicts=('gmpc-lyricwiki' 'gmpc-lyricwiki-svn')
pkgver=20120830
pkgrel=1
pkgdesc="A plugin for gmpc that obtains lyrics from lyricwiki"
url="http://gmpc.wikia.com/wiki/GMPC_PLUGIN_LYRICWIKI"
license=('GPL')
arch=('i686' 'x86_64')
depends=('gmpc-git')
makedepends=('git' 'intltool' 'gob2' 'pkgconfig')
options=('!libtool')
source=('Fixed-building-automake-1.12.patch')
md5sums=('e0bda6d329ba5ad59466380dae453bcd')

_gitroot="git://repo.or.cz/gmpc-lyricwiki.git"
_gitname="gmpc-lyricwiki"
build() {
	cd $srcdir
	msg "Connecting to $_gitroot server..."

	if [ -d $srcdir/$_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	cp -r $srcdir/$_gitname $srcdir/$_gitname-build
	cd $srcdir/$_gitname-build

	patch -p1 < ../../Fixed-building-automake-1.12.patch

	./autogen.sh --prefix=/usr
	make || return 1
	make DESTDIR=$pkgdir install
}

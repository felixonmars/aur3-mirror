#Contributor: William Kennington <webhostbudd@gmail.com>
pkgname=gedit-collaboration-telepathy-git
pkgver=20110420
pkgrel=1
pkgdesc="Similar to Gedit-Collaboration-Git but includes the telepathy framework support added by Felix Kaser"
arch=('i686' 'x86_64')
url="http://kaserf.blogspot.com/2011/03/telepathy-support-for-gedit.html"
license=('other')
provides=('gedit-collaboration-telepathy')
conflicts=('gedit-collaboration')
makedepends=('git')
depends=('libinfinity' 'gedit' 'telepathy-glib')
build() {
	cd $srcdir
	if [ -d "gedit-collaboration" ] ; then
		cd gedit-collaboration
		git fetch
		git merge add-telepathy-support
	else
		git clone git://git.collabora.co.uk/git/user/kaserf/gedit-collaboration.git
		cd gedit-collaboration
		git checkout -b add-telepathy-support origin/add-telepathy-support
	fi
	./autogen.sh --prefix=/usr
	make || return 1
	make DESTDIR="$pkgdir" install || return 1
}

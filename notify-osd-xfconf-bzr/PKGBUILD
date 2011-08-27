# Maintainer: Aliaksandr Stelmachonak <mail.avatar at gmail.com>
# Contributor: Xavier D. <magicrhesus@ouranos.be>

pkgname=notify-osd-xfconf-bzr
pkgver=384
pkgrel=2
pkgdesc="Canonical's on-screen notification display agent: xfconf branch."
url="https://code.launchpad.net/~sidi/notify-osd/xfconf-experimental"
license=('GPL')
arch=('i686' 'x86_64')
depends=('cairo' 'freetype2' 'libwnck' 'xfconf')
makedepends=('bzr' 'gnome-common')
conflicts=('notification-daemon' 'notify-osd')
provides=('notification-daemon' 'notify-osd')
install=notify-osd-xfconf-bzr.install
source=('remove-tests.patch')
md5sums=('a2bfbf21706d6f7d8b0fbfebe8997520')

_bzrbranch=lp:~sidi/notify-osd/xfconf-experimental
_bzrmod=notify-osd

build() {
	cd $srcdir

	echo "Connecting to notify-osd bzr server...."
	if [[ -d $srcdir/$_bzrmod ]] ; then
		cd $_bzrmod && bzr up
		echo "The local files are updated."
	else
		bzr branch $_bzrbranch $_bzrmod
	fi

	echo "bzr checkout done or server timeout"
	echo "Starting make..."
	rm -rf $srcdir/$_bzrmod-build
	cp -r $srcdir/$_bzrmod $srcdir/$_bzrmod-build
	cd $srcdir/$_bzrmod-build
	# remove tests, since thay are fail to build
	patch -Np2 < $srcdir/remove-tests.patch

	./autogen.sh --prefix=/usr --libexecdir=/usr/lib/notify-osd --with-xfconf
	# do not build examples causing redundant build dependencies
	sed -i "s|\(^SUBDIRS.*\)examples\(.*\)$|\1\2|" Makefile
	sed -i "s|-Werror ||" configure.in
	make
	make install DESTDIR=$pkgdir
}
# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=kde-samba-mounter-git
pkgver=20120620
pkgrel=1
pkgdesc="KDE module to easily define and mount samba shares"
arch=(i686 x86_64)
url="http://www.afiestas.org/samba-mounter-quick-fix-for-a-larger-problem/"
license=('GPL')
depends=('kdebase-runtime')
makedepends=('git' 'cmake')

_gitroot="git://anongit.kde.org/scratch/afiestas/samba-mounter.git"
_gitname="samba-mounter"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone --depth=1 $_gitroot $_gitname
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir/$_gitname-build"
	cp -R "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"

	cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/$_gitname-build"
	make DESTDIR="$pkgdir/" install
}

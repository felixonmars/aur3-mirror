# Contributor: Etienne Perot <etienne@perot.me>
pkgname=gitolite-monkeysphere-integration-git
pkgver=20120910
pkgrel=1
pkgdesc='Use your PGP key to push Git commits over SSH'
url='https://perot.me/'
arch=('i686' 'x86_64')
license=('GPL3')
depends=(monkeysphere gitolite)
makedepends=(git bash)

_gitroot="git://perot.me/gitolite-monkeysphere-integration"
_gitname="gitolite-monkeysphere-integration"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone "$_gitroot" "$_gitname"
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"

	make DESTDIR="$pkgdir/" install
}

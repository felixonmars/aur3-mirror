# Maintainer:  Matthew Bauer <mjbauer95@gmail.com>
pkgname='unipkg'
pkgver=20110716
pkgrel=1
pkgdesc="Unipkg: a makepkg fork that can also compile to other package formats like debian and rpm(eventually). Use it like: unipkg -P debian"
arch=('any')
url="http://bauer.dnsdojo.com/Projects/$pkgdir"
license=('GPL')
source=()
depends=('bash')
makedepends=('git')
md5sums=()

_gitroot="git://github.com/matthewbauer/unipkg-pacman.git"
_gitname="unipkg-pacman"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"

	./autogen.sh
	./configure --prefix=/usr --sysconfdir=/etc \
		--localstatedir=/var --enable-doc
	cd scripts
	make makepkg
}

package() {
	cd "$srcdir/$_gitname-build/scripts"
	install -D -m755 makepkg $pkgdir/usr/bin/unipkg
}

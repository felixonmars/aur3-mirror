# Maintainer: Devin Cofer <ranguvar@archlinux@us>
# Contributor: Cainã Costa <sryche@archlinux-br.org>
# Contributor: Patrick Bartels <p4ddy.b@gmail.com>

pkgname=fluxbox-git-32trans
_pkgname=fluxbox
pkgdesc="*box stacking WM with tabbing, dockapps, etc. (Dev version, 32-bit transparency)"
pkgver=20101009
pkgrel=1
arch=('i686' 'x86_64')
license=('MIT')
url="http://www.fluxbox.org/"

makedepends=('git>=1.6.5.1' 'pkgconfig')
depends=('libxft' 'libxpm' 'libxrandr' 'imlib2' 'libxinerama')
conflicts=('fluxbox' 'fluxbox-git')
provides=('fluxbox' 'fluxbox-git')

source=("$_pkgname.desktop")
sha256sums=('e1e6cc6a7e55df1981ff5df1bd345221e657ed68ac12583553b951e454695d67')

backup=('usr/bin/startfluxbox')

_gitroot="git://git.fluxbox.org/fluxbox_lack.git"
_gitbranch="argb"
_gitname="fluxbox.lack"
_gitmasterroot="git://git.fluxbox.org/fluxbox.git"
_gitmasterbranch="master"


options=('!libtool')
build() {
	cd "$srcdir"
	msg "Performing source checkout..."
	if [ -d $_gitname ]; then
		cd $_gitname
		git pull $_gitmasterroot $_gitmasterbranch
		cd ..
	else
		git clone $_gitroot -b $_gitbranch $_gitname
		cd $_gitname
		git pull $_gitmasterroot $_gitmasterbranch
		cd ..
	fi
	msg "Source checkout finished."
	rm -rf $_gitname-build
	git clone $_gitname $_gitname-build
	cd $_gitname-build

	./autogen.sh
	./configure --prefix=/usr --enable-xft --enable-imlib2 --enable-nls \
	            --enable-xinerama --enable-gnome
	make
}
package() {
	cd "$srcdir"/$_gitname-build

	make DESTDIR="$pkgdir" install

	install -Dm644 "$srcdir"/$_pkgname.desktop \
	               "$pkgdir"/etc/X11/sessions/$_pkgname.desktop
	install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$_pkgname/COPYING
}

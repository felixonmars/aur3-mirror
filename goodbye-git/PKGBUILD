# Maintainer: Georg Reinke <guelfey@googlemail.com>

pkgname=goodbye-git
pkgver=20120420
pkgrel=3
pkgdesc="Dead simple GTK/D-Bus shutdown dialog"
arch=('i686' 'x86_64')
url="https://github.com/guelfey/goodbye"
license=('MIT')
depends=('gtk2')
optdepends=('consolekit: shutdown/reboot support' 'upower: suspend/hibernate support')
makedepends=('git')
provides=( )
conflicts=( )
backup=( )
source=( )
md5sums=( )
_gitroot="https://github.com/guelfey/goodbye"
_gitname="goodbye"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."
	if [[ -d "$_gitname" ]]; then
		cd "$_gitname" && git pull origin
		msg "The local files are updated."
	else
		git clone "$_gitroot" "$_gitname"
		cd "$_gitname"
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting build..."

	make
	make PREFIX="$pkgdir/usr" install
}

package() {
	install -d "$pkgdir/usr/share/licenses/goodbye-git"
	install -m 644 "$srcdir/$_gitname/LICENSE" \
		"$pkgdir/usr/share/licenses/goodbye-git"
}

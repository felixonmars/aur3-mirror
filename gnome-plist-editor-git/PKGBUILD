# Maintainer: Tom Richards <tom@tomrichards.net>
# Contributor: Matías Hernández <msdark@archlinux.cl>

pkgname=gnome-plist-editor-git
_pkgname=gnome-plist-editor
pkgver=r10.3e6fd48
pkgrel=1
pkgdesc="A GUI editor for Apple Property List files using libplist"
arch=('i686', 'x86_64')
url="http://cgit.sukimashita.com/gnome-plist-editor.git"
license=('GPL')
groups=('multimedia')
depends=('libimobiledevice' 'usbmuxd' 'libplist')
makedepends=('git')
provides=('gnome-plist-editor')
source=(
	'git+http://git.sukimashita.com/gnome-plist-editor.git'
	'ui.patch'
)
sha256sums=(
	'SKIP'
	'2de9afdb64aca5cc5f4445a63de4baf33e8967d37314bb7e76ee333c910020c7'
)

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"
	patch -p1 < ../ui.patch
}

build() {
	cd "$srcdir/$_pkgname"
	./autogen.sh
	./configure --prefix=/usr
	make || return 1
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir/" install

	mkdir -p "$pkgdir/usr/share"
	install -Dm644 src/gnome-plist-editor.ui "$pkgdir"/usr/share/gnome-plist-editor.ui
}

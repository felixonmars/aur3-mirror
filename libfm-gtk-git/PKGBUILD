# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_pkgbase=libfm
pkgname=$_pkgbase-gtk-git
pkgver=1.2.2.1.35.gf238b1b
pkgrel=1
pkgdesc="A glib/gio-based library to develop file managers. Includes GTK2 widgets and dialogs."
arch=("i686" "x86_64")
url="http://lxde.org"
license=("GPL2")
depends=("gtk2" "menu-cache")
optdepends=("libexif")
makedepends=("git" "libexif" "gtk-doc" "intltool" "vala")
provides=("$_pkgbase" "$_pkgbase-gtk" "$_pkgbase-extra")
conflicts=("$_pkgbase" "$_pkgbase-gtk" "$_pkgbase-extra")
source=("git+https://github.com/lxde/$_pkgbase.git")
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/$_pkgbase"
	git describe --always | sed "s/-/./g"
}

build() {
	cd "$srcdir/$_pkgbase"
	./autogen.sh
	./configure \
		--with-gtk \
		--enable-gtk-doc \
		--disable-udisks \
		--enable-actions \
		--prefix="/usr" \
		--sysconfdir="/etc"
	make
}

package() {
	cd "$srcdir/$_pkgbase"
	make DESTDIR="$pkgdir" install
}

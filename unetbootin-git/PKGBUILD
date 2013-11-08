# Maintainer: Jerome Leclanche <jerome.leclanche+arch@gmail.com>
# Contributor: Det <nimetonmaili at gmail a-dot com>
# Contributor: Godane aka Christopher Rogers <slaxemulator@gmail.com>
# Current i686 Maintainer: ifaigios <ifaigios_at_gmail_dot_com>

_pkgname=unetbootin
pkgname=$_pkgname-git
pkgver=595.6f04b08
pkgrel=1
pkgdesc="Create bootable Live USB drives"
url="http://unetbootin.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')
provides=($_pkgname)
conflicts=($_pkgname)
depends=('syslinux' 'p7zip' 'qt4' 'mtools' 'polkit' 'guisu')
makedepends=('git')
optdepends=('polkit-gnome: to run unetbootin directly from menu')
install="$_pkgname.install"
source=(
	"git://github.com/gkovacs/$_pkgname.git"
	'org.archlinux.pkexec.unetbootin.policy'
)
sha256sums=(
	'SKIP'
	'4de02f754f86707c92d20b1c7cfda323893d3d4ed54047b06c036588e677a87c'
)
_gitname=$_pkgname

pkgver() {
	cd "$srcdir/$_gitname"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
	cd "$srcdir/$_gitname"
	cd "src/$_pkgname"

	./build-nostatic
}

package() {
	cd "$srcdir/$_gitname"
	cd "src/$_pkgname"

	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname.elf"
	ln -s /usr/bin/guisu "$pkgdir/usr/bin/$_pkgname"

	mkdir -p "$pkgdir/usr/share/$_pkgname"
	install -m644 "$_pkgname"_*.qm "$pkgdir/usr/share/$_pkgname/"
	install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

	for i in 16 22 24 32 48 256; do
		install -D "${_pkgname}_$i.png" "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png"
	done

	cd "$srcdir"
	install -Dm644 'org.archlinux.pkexec.unetbootin.policy' "$pkgdir/usr/share/polkit-1/actions/org.archlinux.pkexec.unetbootin.policy"
}

# Maintainer: Romain Porte <microjoe@mailoo.org>

pkgname=i3-dtags-git
pkgrel=1
pkgver=r29.af9521a
pkgdesc="A dynamic tag manager using dmenu for i3wm."
arch=('i686' 'x86_64')
url="http://git.microjoe.org/i3_dtags/about"
license=('custom:WTFPL')
groups=()
depends=('i3-wm' 'bash' 'dmenu' 'cjson-git')
makedepends=('git')
checkdepends=()
optdepends=()
provides=('i3-dtags')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('git+http://git.microjoe.org/i3_dtags')
noextract=()
md5sums=('SKIP')

_gitname='i3_dtags'

pkgver() {
	cd "$srcdir/$_gitname"
	( set -o pipefail
		git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$_gitname"
	make
}

package() {
	cd "$_gitname"

	mkdir -p "$pkgdir/usr/bin"
	make INSTALL_DIR="$pkgdir/usr/bin" install

	install -Dm644 COPYING \
		${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

	install -Dm644 i3-dtags.1 \
		${pkgdir}/usr/share/man/man1/i3-dtags.1

	make clean
}

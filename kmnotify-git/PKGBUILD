# Maintainer: Isaac True <isaac.true@gmail.com>

pkgname=kmnotify-git
pkgver=r33.1ed741d
pkgrel=2
pkgdesc='A keymap layout change notification daemon'

arch=(x86_64 i686 arm)
url='https://github.com/Deathisfatal/kmnotify'
license=('BSD')
depends=( 'libxcb' 'libnotify' 'libxkbcommon-x11' )
makedepends=('git' 'cmake')
source=('git+https://github.com/Deathisfatal/kmnotify.git')
sha1sums=('SKIP')

prepare() {
	cd "$srcdir/kmnotify"
	printf "Git version: r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/kmnotify"
	cmake . 
	make
}

package() {
	cd "$srcdir/kmnotify"
	install -Dm755 kmnotify $pkgdir/usr/bin/kmnotify
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

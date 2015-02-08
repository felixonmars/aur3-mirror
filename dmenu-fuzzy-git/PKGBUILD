# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Your Name <youremail@domain.com>
pkgname=dmenu-fuzzy-git
pkgver=r500.8218add
pkgrel=1
pkgdesc=""
url="https://github.com/TheNeikos/dmenu/"
arch=('i686' 'x86_64')
license=('MIT')
groups=()
depends=('libxinerama' 'sh')
makedepends=('git')
provides=("${pkgname%-fuzzy-git}")
conflicts=("${pkgname%-fuzzy-git}")
source=("${pkgname%-git}::git://github.com/TheNeikos/dmenu/")
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" PREFIX="usr/" install
    install -Dm644 "$srcdir/${pkgname%-git}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

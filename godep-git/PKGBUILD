# Maintainer: Sauyon Lee <sauyon@patchouli>

pkgname=godep-git
pkgver=r93.bbdfa05
pkgrel=1
epoch=
pkgdesc=""
arch=('i686' 'x86_64')
url="http://github.com/tools/godep"
license=('BSD')
groups=()
depends=()
makedepends=('go' 'mercurial')
checkdepends=()
optdepends=()
provides=('godep') # just in case a godep package is added
conflicts=('godep')
source=("$pkgname::git://github.com/tools/godep")
md5sums=('SKIP')
noextract=()

pkgver() {
	cd "$srcdir/$pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"

	go build
}

package() {
  cd "$srcdir/$pkgname"

	install -Dm755 "$pkgname" "$pkgdir/usr/bin/godep"
}

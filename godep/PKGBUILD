# Maintainer: Sauyon Lee <sauyon@patchouli>

pkgname=godep
pkgver=r93.bbdfa05
pkgrel=1
epoch=
pkgdesc="Dependency tool for go"
arch=('i686' 'x86_64')
url="http://github.com/tools/godep"
license=('BSD')
groups=()
depends=()
makedepends=('git' 'go' 'mercurial')
checkdepends=()
optdepends=()
provides=()
conflicts=()
source=("$pkgname::git+https://github.com/tools/godep")
md5sums=('SKIP')
noextract=()

pkgver() {
	cd "$srcdir/$pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	export GOPATH="$srcdir"
	go get code.google.com/p/go.tools/go/vcs
	go get github.com/kr/fs
}

build() {
  cd "$srcdir/$pkgname"

	GOPATH="$srcdir" go build
}

package() {
  cd "$srcdir/$pkgname"

	install -Dm755 "$pkgname" "$pkgdir/usr/bin/godep"
	install -Dm644 License "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

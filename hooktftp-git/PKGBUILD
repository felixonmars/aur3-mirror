# Maintainer: Josh Cartwright <joshc@eso.teric.us>

pkgname=hooktftp-git
pkgver=0.10.0.r28.g8bba8e8
pkgrel=1
pkgdesc="Hook based tftp server"
arch=('x86_64' 'i686')
url="https://github.com/epeli/hooktftp"
license=('MIT')
makedepends=('go' 'bzr')
source=('git://github.com/epeli/hooktftp.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir"/hooktftp
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	# Quick hack to put the makepkg-checked-out clone into GOPATH
	mkdir -p "$srcdir"/src/github.com/epeli
	ln -sf "../../../hooktftp" "$srcdir"/src/github.com/epeli/hooktftp

	GOPATH="$srcdir" go get -v -x launchpad.net/goyaml
}

build() {
	GOPATH="$srcdir" go get github.com/epeli/hooktftp
}

package() {
	install -Dm755 "$srcdir/bin/hooktftp" "$pkgdir/usr/bin/hooktftp"
	install -Dm644 "$srcdir/hooktftp/LICENSE" \
		"$pkgdir/usr/share/licenses/hooktftp/LICENSE"
}

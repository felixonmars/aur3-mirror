# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>

pkgname=go-sfml2
pkgver=20150504
pkgrel=1
pkgdesc="GoSFML2 is a Go binding for SFML2"
arch=('x86_64' 'i686')
url="https://bitbucket.org/krepa098/gosfml2/"
license=('unknown')
depends=('go' 'csfml')
makedepends=('git')
options=('!strip' '!emptydirs')
_gourl=bitbucket.org/krepa098/gosfml2/

build() {
	GOPATH="$srcdir" go get -fix -v -x ${_gourl}
}

pkgver() {
	date +%Y%m%d
}

check() {
	GOPATH="$GOPATH:$srcdir" go test -v -x ${_gourl}
}

package() {
	mkdir -p "$pkgdir/$GOPATH"
	cp -Rv --preserve=timestamps "$srcdir/"{src,pkg} "$pkgdir/$GOPATH"

	# Package license (if available)
	for f in LICENSE COPYING LICENSE.* COPYING.*; do
		if [ -e "$srcdir/src/$_gourl/$f" ]; then
			install -Dm644 "$srcdir/src/$_gourl/$f" \
				"$pkgdir/usr/share/licenses/$pkgname/$f"
		fi
	done
}

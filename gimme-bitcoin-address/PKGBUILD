# Maintainer: Vanya A. Sergeev <vsergeev@gmail.com>
pkgname=gimme-bitcoin-address
pkgver=1.0
pkgrel=1
pkgdesc="Standalone Bitcoin keypair generator"
arch=('i686' 'x86_64')
url="https://github.com/vsergeev/gimme-bitcoin-address"
license=('MIT')
depends=('go')
makedepends=('git')
source=("git://github.com/vsergeev/gimme-bitcoin-address#commit=v1.0")
sha256sums=('SKIP')
_gitname="gimme-bitcoin-address"

build() {
	cd "$srcdir/$_gitname"

    source /etc/profile.d/go.sh
    export GOPATH="$srcdir"
    go get code.google.com/p/go.crypto/ripemd160
	go build
}

package() {
	cd "$srcdir/$_gitname"

	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=mcobj-git
pkgver=0.14.0.gf8d8a15
pkgrel=1
pkgdesc="Exports minecraft worlds to .obj or .prt"
arch=(i686 x86_64)
url=https://github.com/quag/${pkgname%-*}
license=(BSD)
makedepends=(${pkgname%-*}-lib go git)
optdepends=(minecraft)
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
options=(!strip)
source=($pkgname::git://github.com/quag/${pkgname%-*}.git)
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    cd $pkgname/
    git describe --long | sed 's/-/./g'
}

build() {
    cd $pkgname/cmd/${pkgname%-*}/
    go build -o ../../${pkgname%-*}
}

package() {
    cd $pkgname/
    install -Dm755 ${pkgname%-*} "$pkgdir"/usr/share/${pkgname%-*}/${pkgname%-*}
    install -Dm644 blocks.json "$pkgdir"/usr/share/${pkgname%-*}/blocks.json
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

    install -d "$pkgdir"/usr/bin/
    ln -s /usr/share/${pkgname%-*}/${pkgname%-*} "$pkgdir"/usr/bin/${pkgname%-*}
}

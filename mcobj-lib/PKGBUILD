# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=mcobj-lib
pkgver=0.14.0.gf8d8a15
pkgrel=1
pkgdesc="Library files for building mcobj"
arch=(any)
_dir=github.com/quag/${pkgname%-*}
url=http://$_dir
license=(BSD)
makedepends=(go git)
source=($pkgname::git://$_dir.git)
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    cd $pkgname/
    git describe --long | sed 's/-/./g'
}

package() {
    cd $pkgname/
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -d "$pkgdir"/usr/lib/go/src/pkg/$_dir/
    cp -r commandline mcworld nbt "$pkgdir"/usr/lib/go/src/pkg/$_dir/
}

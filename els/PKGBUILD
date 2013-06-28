# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=els
pkgver=1.51c2
pkgrel=1
pkgdesc="An Enhanced LS look-alike with many additional features"
arch=(i686 x86_64)
url=http://els-software.org
license=(unknown)
source=($url/$pkgname/release/$pkgname-$pkgver.tar.gz)
sha256sums=('05056d92efb14a7b53f817a4995bff9eea93e7b109da5d47f1cd755671be296b')
sha512sums=('32c34d5d1d20bb1ae899fd5655d1f9e707e1fc9cf21763f6e15149a5d4d974138d0eeaa2a6a77a79f6758bf7647d585efb76005458eb2d22df82d63d67defa49')

build() {
    make -C $pkgname-$pkgver Linux
}

package() {
    cd $pkgname-$pkgver/
    for i in $pkgname chdate edate; do
        install -Dm755 $i "$pkgdir"/usr/bin/$i
        install -Dm644 $i.1 "$pkgdir"/usr/share/man/man1/$i.1
    done
}

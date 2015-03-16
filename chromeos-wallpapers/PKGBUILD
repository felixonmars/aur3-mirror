# Maintainer: Martijn Atema <AUR@atema.me>
pkgname=chromeos-wallpapers
pkgver=2.0
pkgrel=3
pkgdesc="Chrome OS Wallpapers"
arch=(any)
url="https://github.com/Atema/Chrome-OS-Wallpapers"
license=('unknown')
source=(https://github.com/Atema/Chrome-OS-Wallpapers/archive/$pkgver.tar.gz)
sha1sums=(351e9b15116b7b0f28ac5d4221c86766861dec51)

package() {
    mkdir -p $pkgdir/usr/share/backgrounds/$pkgname
    cp -r $srcdir/Chrome-OS-Wallpapers-$pkgver/* $pkgdir/usr/share/backgrounds/$pkgname
}

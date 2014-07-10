# Maintainer: Niklas Koep <niklas.koep@gmail.com>

pkgname=rygel-systemd
pkgver=1
pkgrel=2
pkgdesc="A systemd service file for the Rygel DLNA server"
arch=("any")
url="https://github.com/nkoep/PKGBUILDs/tree/master/rygel-systemd"
license=("GPL3")
depends=("rygel")
install=$pkgname.install
source=("rygel@.service")
sha256sums=("f23f71f1c703c27e632d290a3b9261ee9cbd679eeb59f153c42d81b0759b8218")

package() {
    cd "$srcdir"
    local target_dir="$pkgdir/usr/lib/systemd/system/"
    mkdir -p $target_dir
    install -v -m 644 -t $target_dir *.service
}


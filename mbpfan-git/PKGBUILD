# Maintainer: Yamakaky <yamakaky at_gmail_dot com>
# Contributor: Allan McRae <allan at_archlinux_dot org>

pkgname=mbpfan-git
pkgver=v.1.5.0.2.ga2dacfd
pkgrel=2
pkgdesc="Automatically adjust the fan on a MacBook Pro"
arch=('i686' 'x86_64')
url="https://github.com/dgraziotin/Fan-Control-Daemon"
license=('GPL3')
makedepends=('git')
provides=('mbpfan')
source=("$pkgname"::'git://github.com/dgraziotin/Fan-Control-Daemon.git'
        'mbpfan.install')
md5sums=('SKIP'
         'e9e2ccddee6f7177d9495781f09c8e39')
install='mbpfan.install'

pkgver(){
    cd "$pkgname"
    local ver="$(git describe --long)"
    printf "%s" "${ver//-/.}"
}

build() {
    cd "$pkgname"
    make
}

package() {
    cd "$pkgname"
    install -Dm755 "$srcdir/$pkgname/bin/mbpfan" "$pkgdir/usr/bin/mbpfan"
    install -Dm644 "$srcdir/$pkgname/mbpfan.conf" "$pkgdir/etc/mbpfan.conf"
    install -Dm644 "$srcdir/$pkgname/mbpfan.service" "$pkgdir/usr/lib/systemd/system/mbpfan.service"
}

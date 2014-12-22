# Maintainer: firstvirus92 <dev[at]firstvirus92[dot]de>

pkgname=openra-dedicated-bleed
pkgver=r14987.5b011e6
pkgrel=1
pkgdesc="OpenRA bleed with minimal dependencies for servers"
arch=("any")
url="http://openra.net"
license=("GPL3")
depends=("mono" "lua51")
makedepends=("git")
conflicts=("openra" "openra-bleed")
backup=("etc/openra-dedicated")
source=("$pkgname-src::git+https://github.com/OpenRA/OpenRA.git#branch=bleed" "openra-dedicated" "openra-dedicated_settings")
sha512sums=("SKIP"
    "0167e5bda222499cf6301737ed4ba76004eafd66b2ce321cabdc1f503d6eddc7f0aaa49016e01b820d7f6fbe047802a5cb4973a0c5914586f28d221dddfa0555"
    "6b86ea35fd5974c52227640144ad2a763ccae83af68b9ff7e328dda5e3ae27a409f65e5150e79d5414172161a32d58626a6896d6bcc16f779368bbdbc8cbd898")

pkgver() {
    cd "$srcdir/$pkgname-src"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname-src"
    make version
    ./configure
    make dependencies
    make all
}

package() {
    cd "$srcdir/$pkgname-src"
    make prefix=/usr DESTDIR="$pkgdir" install-all
    install -m755 -d "$pkgdir"/usr/bin
    install -Dm755 $srcdir/openra-dedicated $pkgdir/usr/bin/openra-dedicated
    install -m755 -d "$pkgdir"/etc
    install -Dm755 $srcdir/openra-dedicated_settings $pkgdir/etc/openra-dedicated
}

# Maintainer: Tom Richards <tom@tomrichards.net>
# https://github.com/t-richards/aur-mcserver-git

pkgname=mcserver-git
pkgver=r8246.5b74987
pkgrel=1
pkgdesc='A performant C++ Minecraft Server'
arch=('x86' 'x86_64')
url='http://mc-server.org'
license=('Apache')
depends=('jansson' 'tmux')
makedepends=('cmake' 'hardening-wrapper')
install="$pkgname.install"
source=("$pkgname"::'git+https://github.com/mc-server/MCServer'
        'service')
sha256sums=('SKIP'
            'bed92eea61d9b9b7222c1e5aa0c001615d2517bdca2bb9a83ba769c79a7b1289')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"
    git submodule init
    git submodule update
}

build() {
    cd "$srcdir/$pkgname"
    cmake . -DBUILD_TOOLS=1 -DSELF_TEST=1
    make
}

check() {
    cd "$srcdir/$pkgname"
    make test
}

package() {
    cd "$srcdir/$pkgname"
    install -d "$pkgdir"/srv/mcserver
    cp -R MCServer/* "$pkgdir"/srv/mcserver/.

    install -Dm644 "$srcdir"/service "$pkgdir"/usr/lib/systemd/system/mcserver.service
}

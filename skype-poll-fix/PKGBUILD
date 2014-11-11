# Maintainer: Somasis <somasis@cryptolab.net>

pkgname=skype-poll-fix
pkgver=r23.a47f911
pkgrel=1
pkgdesc='LD_PRELOAD hack to reduce Skype CPU by increasing poll call timeouts'
arch=('i686' 'x86_64')
url='https://github.com/ValdikSS/skype-poll-fix'
depends=('skype')
license=('unknown')
install="$pkgname.install"
source=('git://github.com/ValdikSS/skype-poll-fix.git' 'skype-with-poll-fix')
sha256sums=('SKIP'
            'bc765dd33ef3e9cc6e965ead671ebc27983455dbc44214c820bc493537d3a679')

if [[ "$CARCH" == "x86_64" ]];then
    libdir="usr/lib32/skype"
    makedepends=('gcc-multilib')
else
    libdir="usr/lib/skype"
fi

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    make
}

package() {
    mkdir -p "$pkgdir/$libdir" "$pkgdir/usr/bin"
    install -m755 "$srcdir/$pkgname/skype-poll-fix.so" "$pkgdir/$libdir/skype-poll-fix.so"
    install -m755 "$srcdir/skype-with-poll-fix" "$pkgdir/usr/bin/skype-with-poll-fix"
}

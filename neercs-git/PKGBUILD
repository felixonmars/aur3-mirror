# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Will Chappell <mr.chapendi@gmail.com>

_pkgname=neercs
pkgname=$_pkgname-git
pkgver=438.f910852
pkgrel=2
pkgdesc="Like GNU screen, it allows you to detach a session from a terminal, but provides unique features."
arch=(i686 x86_64)
url=http://caca.zoy.org/wiki/neercs
license=(custom:WTFPL)
depends=(libcaca python)
makedepends=(git)
source=($pkgname::git://git.zoy.org/$_pkgname.git
    COPYING)
sha256sums=('SKIP'
    '7637386b5f81e8a719ca336233149005e5fa28b5e6054ea7b67de49355b0ad40')
sha512sums=('SKIP'
    'fb6575315a22516e29ad414c8e0c9074e0e18a5361ce746524d938e0bf329f7b742b66dc43cfba138f69534d747507e2983b34149d7c66bd4ae2e1b435e37034')

pkgver() {
    cd $pkgname/
    echo $(git shortlog | grep -c '\s\+').$(git describe --always)
}

prepare() {
    sed -i 's:AM_CONFIG_HEADER:AC_CONFIG_HEADERS:' $pkgname/configure.ac
}

build() {
    cd $pkgname/
    autoreconf -fi
    ./configure --prefix=/usr enable_doc=no
    make
}

package() {
    make -C $pkgname DESTDIR="$pkgdir" install
    install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}

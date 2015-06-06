# Maintainer: Kamal Nasser <hello@kamal.io>
pkgname=thinkbacklight
pkgdesc="Controls the keyboard backlight on modern Thinkpads"
pkgver=0.1
pkgrel=1
url="https://github.com/kamaln7/thinkbacklight-aur"
arch=('any')
makedepends=('glibc>=2.0.0' 'pkg-config')
source=("thinkbacklight.c")
md5sums=('0fd95c3278df771d9037ea893924882b')

build() {
    cd "$srcdir"
    gcc -o thinkbacklight $(pkg-config --libs --cflags glib-2.0) thinkbacklight.c
    chmod +x thinkbacklight
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    cp "$srcdir/thinkbacklight" "$pkgdir/usr/bin/thinkbacklight"
}

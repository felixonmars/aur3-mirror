# Maintainer: jianqun <jianqun@chinesemail.net>

pkgname=elementary-icon-theme
pkgver=3.0
pkgrel=1
pkgdesc="An icon theme designed to be smooth, sexy, clear, and efficient."
arch=('any')
url="https://launchpad.net/elementaryicons"
license=('GPL3')
depends=('librsvg')
optdepends=('greybird-themes: Desktop Suite for Xfce.')
conflicts=('elementary-icons' 'elementary-icons-old')
source=(
    "http://cache.chinesehost.net/download/linux/$pkgname-$pkgver-$pkgrel.tar.gz"
    "start-here.svg"
)
md5sums=(
    '7c74684926cfbf58782948d4dc8c79f6'
    '3f6fcc73af0b4dc3e4d73ff9201c8d7a'
)

package() {
    cd "$srcdir/elementary/"
    rm -v {.bzrignore,AUTHORS,CONTRIBUTORS,COPYING}
    cd "$srcdir/elementary/panel/22/"
    for i in audio*-panel.svg; do ln -s "$i" "${i%-panel.svg}.svg"; done
    install -Dm644 "$srcdir/start-here.svg" "$srcdir/elementary/panel/22/start-here.svg"
    cd "$srcdir/elementary/"
    install -d "$pkgdir/usr/share/icons/elementary"
    cp -Rf . "$pkgdir/usr/share/icons/elementary/"
}

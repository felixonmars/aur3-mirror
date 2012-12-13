# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Asparagus Maximus <asparagus.maximus@gmail.com>

pkgname=thinkhdaps
pkgver=0.2.1
pkgrel=3
pkgdesc="A standalone GTK applet for HDAPS disk protection status"
arch=(any)
url=http://thpani.at/projects/$pkgname
license=(GPL3)
depends=(pygtk gnome-python tp_smapi hdapsd)
source=(http://thpani.at/media/downloads/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('826fd9a1153adb49bc46a81ae60cc01cd77ba6ade7e135493908ca8185825d18')
sha512sums=('207ee7c506a94fba3a7639c4eca6bf5b80a5fe67dac2e6e410fa70c8552eed29e478c52906a9049ce5a6fbe2c2b0680d06b32ecd4455073c360b5b41895e1b5f')

build() {
    cd "$srcdir"/$pkgname-$pkgver/
    ./configure --prefix=/usr --enable-desktop
    make
}

package() {
    make -C $pkgname-$pkgver DESTDIR="$pkgdir" install
    sed -i 's:^#!/usr/bin/python$:&2:' "$pkgdir"/usr/bin/$pkgname
}

# Maintainer: Viacheslav Chumushuk <voice@root.ua>

pkgname=alsa-go
pkgver=0.0
pkgrel=2
pkgdesc="ALSA wrapper for C alsa-lib library."
arch=('i686' 'x86_64')
url="https://github.com/vchumushuk/alsa-go"
license=('GPL3')
depends=('alsa-lib' 'go')
source=('https://download.github.com/vchumushuk-alsa-go-b0db83c.tar.gz')
md5sums=('d2077f7f3400354f2130105349c920fc')
options=(!strip)

build() {
    . /etc/profile.d/go.sh

    # cd "$startdir/src/$pkgname-$pkgver" || return 1
    cd "$startdir/src" || return 1
    mv vchumushuk-alsa-go-b0db83c "$pkgname-$pkgver" || return 1
    cd "$pkgname-$pkgver"

    make || return 1
    make test || return 1
    make DESTDIR="$startdir/pkg" arch-install || return 1
}

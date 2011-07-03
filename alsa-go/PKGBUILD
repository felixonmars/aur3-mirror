# Maintainer: Viacheslav Chumushuk <voice@root.ua>

pkgname=alsa-go
pkgver=0.0
pkgrel=3
pkgdesc="ALSA wrapper for C alsa-lib library."
arch=('i686' 'x86_64')
url="https://github.com/vchumushuk/alsa-go"
license=('GPL3')
depends=('alsa-lib' 'go')
source=('https://download.github.com/vchumushuk-alsa-go-29d3cf4.tar.gz')
md5sums=('f27ff631a20737090f37b09e45c79cbc')
options=(!strip)

build() {
    . /etc/profile.d/go.sh

    # cd "$startdir/src/$pkgname-$pkgver" || return 1
    cd "$startdir/src" || return 1
    mv vchumushuk-alsa-go-29d3cf4 "$pkgname-$pkgver" || return 1
    cd "$pkgname-$pkgver"

    make || return 1
    make test || return 1
    make DESTDIR="$startdir/pkg" arch-install || return 1
}

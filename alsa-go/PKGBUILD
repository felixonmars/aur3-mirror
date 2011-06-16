# Maintainer: Viacheslav Chumushuk <voice@root.ua>

pkgname=alsa-go
pkgver=0.0
pkgrel=1
pkgdesc="ALSA wrapper for C alsa-lib library."
arch=('i686' 'x86_64')
url="https://github.com/vchumushuk/alsa-go"
license=('GPL3')
depends=('alsa-lib' 'go')
source=('https://github.com/downloads/vchumushuk/alsa-go/alsa-go-0.0.tar.gz')
md5sums=('b40bb23976477451e8e35c680d35ad77')
options=(!strip)

build() {
    . /etc/profile.d/go.sh

    cd "$startdir/src/$pkgname-$pkgver" || return 1
    make || return 1
    make test || return 1
    make DESTDIR="$startdir/pkg" arch-install || return 1
}

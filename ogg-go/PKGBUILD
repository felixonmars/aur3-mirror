# Maintainer: Viacheslav Chumushuk <voice@root.ua>

pkgname=ogg-go
pkgver=0.0
pkgrel=1
pkgdesc="Go wrapper for C libogg library."
arch=('i686' 'x86_64')
url="https://github.com/vchumushuk/ogg-go"
license=('GPL3')
depends=('libogg' 'go')
source=('https://github.com/downloads/vchumushuk/ogg-go/ogg-go-0.0.tar.gz')
md5sums=('9a265c18511f828efbace93f32dd67d1')
options=(!strip)

build() {
    . /etc/profile.d/go.sh

    cd "$startdir/src/$pkgname-$pkgver" || return 1
    make || return 1
    make test || return 1
    make DESTDIR="$startdir/pkg" arch-install || return 1
}

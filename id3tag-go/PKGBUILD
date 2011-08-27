# Maintainer: Viacheslav Chumushuk <voice@root.ua>

pkgname=id3tag-go
pkgver=0.1
pkgrel=1
pkgdesc="id3tag is a Go wrapper around C libid3tag library."
arch=('i686' 'x86_64')
url="https://github.com/vchumushuk/id3tag-go"
license=('GPL3')
depends=('libid3tag' 'go')
source=("https://github.com/downloads/vchumushuk/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('ef74f9e04de5f1064d20110fd1034bd6')
options=(!strip)

build() {
    . /etc/profile.d/go.sh

    cd "$startdir/src/$pkgname-$pkgver" || return 1
    make || return 1
    make test || return 1
    make DESTDIR="$startdir/pkg" arch-install || return 1
}

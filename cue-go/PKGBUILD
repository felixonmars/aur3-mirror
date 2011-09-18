# Maintainer: Viacheslav Chumushuk <voice@root.ua>

pkgname=cue-go
pkgver=0.0
pkgrel=1
pkgdesc='cue is the cue-sheet parser implemented in Go language.'
arch=('i686' 'x86_64')
url='https://github.com/vchumushuk/cue-go'
license=('GPL3')
depends=('go')
source=('https://nodeload.github.com/vchumushuk/cue-go/tarball/72c7b24246')
md5sums=('9bf856ae39e673f2788f83e56e696c89')
options=(!strip)

build() {
    . /etc/profile.d/go.sh

    cd "$startdir/src" || return 1
	mv vchumushuk-cue-go-72c7b24 "$pkgname-$pkgver" || return 1
	cd "$pkgname-$pkgver"

    make || return 1
    make test || return 1
    make DESTDIR="$startdir/pkg" arch-install || return 1
}

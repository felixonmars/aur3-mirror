# Contributor: Jonathan Arnold <jdarnold@buddydog.org>

pkgname=iceray-git
pkgver=0.2
pkgrel=7
pkgdesc="Icecast/Shoutcast commandline client"
arch=('i686' 'x86_64')
url="https://github.com/jdarnold/iceray"
license=('MIT')
depends=('libshout')
makedepends=('go')
conflicts=('iceray')
provides=('iceray')
options=('!strip' '!emptydirs')
_gourl="github.com/jdarnold/iceray"
install=${pkgname}.install

build() {
    cd "$srcdir"
    GOPATH="$srcdir" go get -v -x ${_gourl}/...
}

package() {
    install -Dm755 "$srcdir/bin/iceray" "$pkgdir/usr/bin/iceray"
    install -Dm644 "$srcdir/src/$_gourl/iceray.gcfg.sample" "$pkgdir/usr/share/iceray/iceray.gcfg.sample"
    #install -D -m644 iceray.1 $(DESTDIR)$(MANPREFIX)/man1/iceray.1
}

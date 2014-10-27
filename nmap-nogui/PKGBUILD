# Maintainer: Jakub Klinkovský <kuba.klinkovsky@gmail.com>

pkgname=nmap-nogui
_pkgname=nmap
pkgver=6.47
pkgrel=1
pkgdesc='Utility for network discovery and security auditing'
url='http://nmap.org/'
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('python2')
depends=('pcre' 'openssl' 'libpcap' 'lua')
source=("http://nmap.org/dist/$_pkgname-$pkgver.tar.bz2")
sha1sums=('0c917453a91a5e85c2a217d27c3853b0f3e0e6ac')

build() {
    cd "$srcdir/$_pkgname-$pkgver"

    PYTHON=python2 ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib \
        --mandir=/usr/share/man \
        --without-zenmap
    make
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"

    make DESTDIR="$pkgdir" install

    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

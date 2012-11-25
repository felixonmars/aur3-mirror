# Contributor: Oliver Mader <b52@reaktor42.de>

pkgname=sylpheed-elementary
pkgver=3.3.0
pkgrel=1
pkgdesc="Lightweight and user-friendly e-mail client including an elementary based iconset."
arch=('i686' 'x86_64')
url="http://sylpheed.sraoss.jp/en/"
provides=('sylpheed')
license=('GPL')
depends=('gpgme' 'gtkspell' 'desktop-file-utils')
makedepends=('compface' 'openssl')
options=('!libtool')
install="sylpheed.install"
source=("http://sylpheed.sraoss.jp/sylpheed/v3.3/sylpheed-$pkgver.tar.bz2"
        "http://reaktor42.de/~b52/code/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('20442f81dbb4e7c59462360ad0bb1afb'
         'be3071739ec445f6e2ade9b58bee805c')

build() {
    cd "$srcdir/sylpheed-$pkgver"

    cp -rf $srcdir/$pkgname-$pkgver/src/icons/ $srcdir/sylpheed-$pkgver/src/
    
    ./configure --prefix=/usr --enable-ldap || return 1
    make || return 1

    cd plugin/attachment_tool && make || return 1
}

package () {
    cd "$srcdir/sylpheed-$pkgver"

    make DESTDIR="$pkgdir/" install || return 1

    cd plugin/attachment_tool && make DESTDIR="$pkgdir/" install-plugin || return 1
}


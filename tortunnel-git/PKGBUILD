# Maintainer: moebiuseye <möëbïüs döt ëÿë ät gmäïl döt cöm>

pkgname=tortunnel-git
pkgver=0.3.4.gfb37988
pkgrel=1
pkgdesc="A partial Onion Proxy implementation that's designed to build single-hop circuits through Tor exit nodes "
arch=('x86_64' 'i686')
url="http://github.com/moxie0/tortunnel"
license=('GPL3')
depends=('boost' 'openssl')
makedepends=('git' 'automake' 'autoconf' 'intltool')
conflicts=('tortunnel')
provides=('tortunnel')
source=("git://github.com/moxie0/tortunnel.git")
md5sums=('SKIP')

_gitroot="tortunnel"

pkgver () {
    cd "$srcdir/$_gitroot"
    git describe --always | sed 's|-|.|g'
}

build() {
    cd "$srcdir/$_gitroot"
    echo "breath deep..."
    echo "AUTOMAKE_OPTIONS = subdir-objects" >> ./Makefile.am
    aclocal; autoconf ; automake --add-missing
    ./configure
    make
}

package() {
    cd "$srcdir/$_gitroot"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

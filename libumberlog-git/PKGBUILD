# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Brian Knox <taotetek@gmail.com>

pkgname=libumberlog-git
pkgver=0.3.0.3.g61eebd3
pkgrel=1
pkgdesc="CEE compliant drop in replacement for syslog()"
arch=(i686 x86_64)
url=https://github.com/deirf/${pkgname%-*}
license=(BSD)
depends=(json-c)
makedepends=(git)
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
options=(!libtool)
source=($pkgname::git://github.com/deirf/${pkgname%-*}.git)
sha256sums=('SKIP')
sha512sums=('SKIP')

pkgver() {
    cd $pkgname/
    git describe | sed 's/^libumberlog-//;s/-/./g'
}

prepare() {
    cd $pkgname/
    sed -i -e 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' -e 's/AM_PROG_CC_STDC/AC_PROG_CC/' configure.ac
    install -d m4/
}

build() {
    cd $pkgname/
    autoreconf -fi
    ./configure --prefix=/usr
    make
}

package() {
    cd $pkgname/
    make install DESTDIR="$pkgdir"
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

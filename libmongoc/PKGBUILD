#Maintainer: Tyler Brock <tyler.brock@gmail.com>

pkgname='libmongoc'
_pkgname='mongo-c-driver'
pkgver='1.1.5'
pkgrel='1'

pkgdesc='The official MongoDB client library written in C.'
arch=('i686' 'x86_64' 'armv7h')
url='http://www.mongodb.org/display/DOCS/C+Language+Center'
license=('Apache')
depends=(
    'libbson>=1.0.5'
)
makedepends=(perl)
optdepends=(
    'xmlto: documentation'
    'asciidoc: documentation'
    'python: documentation'
    'libsasl>=2.1.6: sasl support'
    'openssl: ssl support'
)
source=("https://github.com/mongodb/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('6f20874ec9b65afbaed84cab5035891f60e1948374d69612fa168cab21c834e2')

prepare() {
    cd "$srcdir/$_pkgname-$pkgver"
    ./autogen.sh
}

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    ./configure --prefix='/usr' CFLAGS='-pthread' LDFLAGS='-lpthread' --enable-man-pages=no --enable-examples=no --enable-tests=no
    make
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}

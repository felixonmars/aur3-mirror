# Contributor: Roberto Alsina <ralsina@kde.org>
# Maintainer: <sblatchford@gmail.com
pkgname=ripmime
pkgver=1.4.0.10
pkgrel=2
pkgdesc="A MIME attachment extraction tool."
url="http://www.pldaniels.com/ripmime/"
license=( 'BSD' )
depends=( 'glibc' )
makedepends=()
conflicts=()
replaces=()
backup=()
arch=('i686' 'x86_64')
install=
source=(http://www.pldaniels.com/ripmime/$pkgname-$pkgver.tar.gz)
md5sums=('bb0844b0e73625ef79206d3fe620716e')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i 's/^CFLAGS=-Wall -g -I. -O2 -Werror$/CFLAGS=-Wall -I. -O2/' Makefile
    sed -i 's/^CFLAGS=-Wall -g -O2 -I. -Werror$/CFLAGS=-Wall -O2 -I./' ripOLE/Makefile
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -D -m0755 ripmime "${pkgdir}/usr/bin/ripmime"
    gzip -f ripmime.1
    install -D -m0644 ripmime.1.gz "${pkgdir}/usr/share/man/man1/ripmime.1.gz"
    install -D -m0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

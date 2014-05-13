# Maintainer: Diogo Leal <estranho@diogoleal.com>

pkgname=tsung
pkgver=1.5.1
pkgrel=2
pkgdesc="Erlang-based open-source multi-protocol distributed load testing tool"
arch=('i686' 'x86_64')
url="http://tsung.erlang-projects.org"
license=('GPL')
depends=('erlang' 'gnuplot' 'perl')
source=("http://tsung.erlang-projects.org/dist/$pkgname-$pkgver.tar.gz")
md5sums=('7759f94546b64adb185a38b3f3bf072f')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr

}
package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
    make DESTDIR="${pkgdir}" install
}

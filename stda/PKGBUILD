# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
pkgname=stda
pkgver=1.2.1
pkgrel=1
pkgdesc="Simple Tools for Data Analysis"
arch=('any')
url="http://freeshell.de/~drimiks/gnu/stda.html"
license=('GPL3')
depends=('awk' 'coreutils' 'dash')
optdepends=('gnuplot: plotting')
changelog=Changelog
source=("http://freeshell.de/~drimiks/gnu/download.cgi/gnu/stda/${pkgname}-${pkgver}.tar.gz")
sha256sums=('49b41b02fc19d48c054e65d0fe518b08dbe5f84e0979a7443cace8b2292ce09e')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    ./install.sh -q -b "${pkgdir}/usr/bin" -m "${pkgdir}/usr/share/man/man1" install

    # some documentation
    install -dm 755 "${pkgdir}/usr/share/doc/${pkgname}"
    install -m 644 AUTHORS NEWS README "${pkgdir}/usr/share/doc/${pkgname}"
}


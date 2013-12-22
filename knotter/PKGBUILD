# Maintainer: Mohammed Chelouti <mhc23 at web dot de>
pkgname=knotter
pkgver=0.9.6
pkgrel=1
pkgdesc="An editor for Celtic knotworks with SVG export capabilities."
arch=('i686', 'x86_64')
url='http://www.knotdraw.org/'
license=('GPL3')
depends=('qt4>=4.8')
options=!buildflags
source=("https://sourceforge.net/projects/knotter/files/${pkgver%.*}/$pkgname-$pkgver.tar.gz")
sha256sums=('0f2e13a8682029bd237c238abe3c7e35f3b6cfa7cf464343b77761f8a2b0d30f')


build() {
    cd "$srcdir/$pkgname-$pkgver"
    chmod -R a+r "./data"
    QMAKE=qmake-qt4 ./configure.sh --prefix="$pkgdir/usr"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make install
}

# Maintainer: Bartłomiej Piotrowski <barthalion@gmail.com>

pkgname=pentadactyl
pkgver=1.1
pkgrel=1
pkgdesc="A free browser add-on for Firefox, designed to make browsing more efficient and especially more keyboard accessible"
url="http://5digits.org/pentadactyl/index"
arch=('any')
license=('MIT')
depends=('firefox>=24.0')
source=("https://addons.mozilla.org/firefox/downloads/file/249096/$pkgname-$pkgver-fx.xpi")
md5sums=('da4414d49f5e5b6690cfbbf4de7644d9')

package() {
    _emid=pentadactyl@dactyl.googlecode.com #TODO: Extract from install.rdf
    _dstdir="$pkgdir/usr/lib/firefox/browser/extensions/$_emid"

    cd "$srcdir"
    install -d "$_dstdir"
    cp -R * "$_dstdir"
    rm "$_dstdir/$pkgname-$pkgver-fx.xpi"
}

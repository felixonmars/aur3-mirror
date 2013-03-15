# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Jon Kristian Nilsen <jokr.nilsen@gmail.com>

pkgname=deskbar-gnomecatalog
pkgver=2.22.1
pkgrel=1
pkgdesc="Plugin (handler) for the deskbar applet. It allows for searched in the specified gnomecatalog catalog. Installation is simple and easy."
arch=(any)
url=https://sites.google.com/site/slawekmikula2/software/gnomecatalogdeskbarhandler
license=('GPL')
depends=(deskbar-applet gnomecatalog python)
source=(http://slawek.mikula.googlepages.com/${pkgname}_$pkgver.tar.gz)
sha256sums=('dbc95097d96ff0ebb10cb019c188c84e79ffd092870976f7fd5e3a0e160fa62d')
sha512sums=('281e5fcd439a352a67d913201619c25dd1472deecbc047fd94527672e94c6012e61dd47a7788244169db923afe6678888ca0536986e829f429712b59be6c2e3f')

package() {
    install -Dm755 "$srcdir"/${pkgname}_$pkgver/gnomecatalog.py "$pkgdir"/usr/lib/deskbar-applet/modules-2.20-compatible/gnomecatalog.py
}

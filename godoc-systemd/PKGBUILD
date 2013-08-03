# Maintainer: Joshua Marsh <joshua@themarshians.com>
pkgname=godoc-systemd
pkgver=1.1
pkgrel=1
pkgdesc="Go Documentation HTTP Server Service"
arch=(any)
url="http://github.com/icub3d/godoc-systemd"
license=('MIT')
depends=(go)
source=("https://raw.github.com/icub3d/godoc-systemd/master/godoc.service")
sha256sums=('8479941c5e958da978472fb7ce571db18668386b07c4cdf1192c8e518b7e7fe7')

package() {
    cd $srcdir

    install -m644 -D godoc.service \
        $pkgdir/etc/systemd/system/godoc.service
}

# Contributor: Jib <jbc.as (AT) free.fr>
# Last update: 12/10/10

pkgname=xcursor-bisigi
_pkgname=bisigi-cursor-theme
pkgver=0.3
pkgrel=1
pkgdesc="Cursor theme for Bisigi Gnome themes."
arch=(any)
license=('GPL')
depends=()
source=(https://launchpad.net/~bisigi/+archive/ppa/+files/bisigi-cursor-theme_0.3.maverick.ppa6.tar.gz)
url="http://www.bisigi-project.org"
md5sums=('9236cf2e92626e444ee7f308175f2a92')

package() {
    cd ${srcdir}/bisigi-cursors
    install -d ${pkgdir}/usr/share/{icons,doc/bisigi/cursor-themes}
    local _z=""
    for _z in Cursors/*.tar.bz2; do tar xjf $_z -C ${pkgdir}/usr/share/icons/; done
    install -D -m644 credits ${pkgdir}/usr/share/doc/bisigi/cursor-themes/credits.txt
}

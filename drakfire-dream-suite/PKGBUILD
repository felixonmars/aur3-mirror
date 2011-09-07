
# Author: Drakfire86 <http://drakfire86.deviantart.com/>
# Maintainer: foalsrock <foalsrock at gmail dot com>

pkgname=drakfire-dream-suite
pkgver=0.6
pkgrel=2
pkgdesc="Drakfire dream suite, includes gtk3, gtk2 and gnome-shell theme."
url="http://drakfire86.deviantart.com/art/drakfire-dream-suite-251234682"
license=('cc-by-nc-sa-3.0')
arch=('any')
depends=('gtk-engine-unico' 'gtk-engine-murrine')
makedepends=('unzip')
optdepends=('gnome-shell')
source=("http://www.deviantart.com/download/251234682/drakfire_dream_suite_by_drakfire86-d45ktx6.zip")
DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry=3 -H -U Mozilla -O %o %u')
md5sums=('3c784d90feee6b15088583a728fb2622')

package() {
    mkdir -p "${pkgdir}/usr/share/themes"
    unzip "${srcdir}/drakfire_dream_suite_by_drakfire86-d45ktx6.zip" -d "${pkgdir}/usr/share/themes"
    find "${pkgdir}" -name '*~' -type f -exec rm -f '{}' \;
}

# Maintainer: foalsrock <foalsrock at gmail dot com>

pkgname=gnome-shell-extension-recent-items
pkgver=4
pkgrel=1
_gpkgid=226
pkgdesc="Adds an icon for recently used items"
arch=('any')
url="https://extensions.gnome.org/extension/72/recent-items/"
license=('unknown')
depends=('gnome-shell')
makedepends=('unzip')
groups=('gnome-shell-extensions')
source=("https://extensions.gnome.org/review/download/${_gpkgid}.shell-extension.zip")
md5sums=('04863e4dfd588cd4dcc4db7fa7ac61bc')

package()
{
    mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/RecentItems@bananenfisch.net"
    unzip "${srcdir}/${_gpkgid}.shell-extension.zip" -d "${pkgdir}/usr/share/gnome-shell/extensions/RecentItems@bananenfisch.net/"
    find "${pkgdir}" -name '*' -type f -exec chmod 644 -f '{}' \;

    # Uncomment the line below to increase recent items entries to 20 (or any other value)
    #sed '61s/15/20/' -i "${pkgdir}/usr/share/gnome-shell/extensions/RecentItems@bananenfisch.net/extension.js"
}

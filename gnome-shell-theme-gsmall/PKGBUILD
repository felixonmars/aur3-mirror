# Author: Solo-Dev <http://solo-dev.deviantart.com/>
# Maintainer: foalsrock <foalsrock at gmail dot com>

pkgname=gnome-shell-theme-gsmall
pkgver=1
pkgrel=2
pkgdesc="A slimmed down version of the default GNOME Shell theme ."
url="http://solo-dev.deviantart.com/art/gSmall-244635459"
license=('unknown')
arch=('any')
depends=('gnome-shell')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
            'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("http://www.deviantart.com/download/244635459/gsmall_by_solo_dev-d41ndxf.zip"
        "3.2compat.patch")
DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry=3 -H -U Mozilla -O %o %u')
md5sums=('29eb035f522001f9d1806681332d780a'
         'd17ebefb2d394eb1938565269d154b5f')

package() {
    mkdir -p "${pkgdir}/usr/share/themes"
    mv "${srcdir}/gSmall" "${pkgdir}/usr/share/themes/"

    # small cleanup
    find "${pkgdir}" \( -name '*.*~' -o -name '*copy*.*' \) -type f -exec rm -f '{}' \;

    # patch for 3.2
   patch "${pkgdir}/usr/share/themes/gSmall/gnome-shell/gnome-shell.css" "${srcdir}/3.2compat.patch"
}



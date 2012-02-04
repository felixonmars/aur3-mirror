# Author: Solo-Dev <http://solo-dev.deviantart.com/>
# Maintainer  sanderd17 < sanderd17 AT gmail DOT com >

pkgname=gnome-shell-theme-gsmall-single-user
pkgver=20110924
pkgrel=1
pkgdesc="A slimmed down version of the default GNOME Shell theme. No system wide installation."
url="http://solo-dev.deviantart.com/art/gSmall-244635459"
license=('unknown')
arch=('any')
depends=('gnome-shell')
optdepends=('gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
            'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("http://www.deviantart.com/download/244635459/gsmall_by_solo_dev-d41ndxf.zip")
DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry=3 -H -U Mozilla -O %o %u')
md5sums=('29eb035f522001f9d1806681332d780a')

package() {
    mkdir -p "${pkgdir}$HOME/.themes"
    mv "${srcdir}/gSmall" "${pkgdir}$HOME/.themes/"

    # small cleanup
    find "${pkgdir}" \( -name '*.*~' -o -name '*copy*.*' \) -type f -exec rm -f '{}' \;
}



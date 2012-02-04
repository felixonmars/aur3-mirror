# Maintainer:  Elder Marco <eldermarco at gmail dot com>

pkgname=gnome-shell-theme-elegano
pkgver=0.2
pkgrel=2
pkgdesc="The EleganO gnome-shell theme"

license=('GPL' 'LGPL2.1')
url="http://msuggs.deviantart.com/art/EleganO-274346366"
source=('http://www.deviantart.com/download/274346366/elegano_by_msuggs-d4jc70e.zip')

depends=('gnome-shell>=3.2.0' 'gnome-shell-extension-user-theme')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options')

arch=('any')
md5sums=('3f69fdbd0c05869e2e8bcfa0c20dbf91')

package () {
    cd "$srcdir/EleganO"

    # The theme
    mkdir -p "$pkgdir/usr/share/themes/EleganO/gnome-shell"
    install -Dp -m0644 gnome-shell/* \
        "$pkgdir/usr/share/themes/EleganO/gnome-shell/"

    # Remove backup files
    find "$pkgdir" -name '*~' -type f -exec rm -f '{}' \;
}
# expandtab:tabstop=4:shiftwidth=4

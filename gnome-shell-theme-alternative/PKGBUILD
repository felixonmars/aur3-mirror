# Maintainer:  Elder Marco <eldermarco at gmail dot com>

pkgname=gnome-shell-theme-alternative
pkgver=3.4
pkgrel=1
pkgdesc="The Alternative gnome-shell theme"

license=('GPL3' 'LGPL2.1')
url="http://half-left.deviantart.com/art/GNOME-Shell-Alternative-290221097"
source=('http://www.deviantart.com/download/290221097/gnome_shell___alternative_by_half_left-d4ssg15.zip')

depends=('gnome-shell>=3.4.0' 'gnome-shell-extension-user-theme-git')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options')

arch=('any')
md5sums=('41f4bb88b3ce8c4acf40c2680987f25b')

package () {
    cd "$srcdir"
    _theme=Alternative
    _theme_dir=$_theme-3.4

    cd "$_theme_dir"

    mkdir -p "$pkgdir/usr/share/themes/$_theme/gnome-shell"

    # Put the theme files into some data dir
    cp -pr gnome-shell/* \
        "$pkgdir/usr/share/themes/$_theme/gnome-shell/"

    # Delete backup files (*~)
    find "$pkgdir" -name '*~' -type f -exec rm -f '{}' \;

    # Remove LICENSE file from $pkgdir
    find "$pkgdir" -name LICENSE -type f -exec rm -f '{}' \;
}
# expandtab:tabstop=4:shiftwidth=4

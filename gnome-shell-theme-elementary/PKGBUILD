# Mantainer: Diego Principe <cdprincipe@at@gmail@dot@com>
# Contributor:  Elder Marco <eldermarco at gmail dot com>
# Contributor: h0neycrysp <h0neycrysp@gmail.com>

pkgname=gnome-shell-theme-elementary
pkgver=3.4
pkgrel=3
pkgdesc="The Elementary gnome-shell theme"
arch=('any')

license=('GPL3' 'LGPL2.1')
url="http://half-left.deviantart.com/art/GNOME-Shell-Elementary-251536124"
source=('http://fc08.deviantart.net/fs70/f/2012/094/0/1/gnome_shell___elementary_by_half_left-d45raik.zip')
depends=('gnome-shell>=3.4.0')
optdepends=('gnome-tweak-tool: A tool to customize advanced GNOME 3 options')


package () {
    cd "$srcdir"
    _theme=Elementary
    _theme_dir=$_theme-3.4

    cd "$_theme_dir"

    mkdir -p "$pkgdir/usr/share/themes/$_theme/gnome-shell"

    # put the theme files into some data dir
    cp -pr gnome-shell/* \
        "$pkgdir/usr/share/themes/$_theme/gnome-shell/"

    # delete backup files (*~)
    find "$pkgdir" -name '*~' -type f -exec rm -f '{}' \;

    # Remove LICENSE file from $pkgdir
    find "$pkgdir" -name LICENSE -type f -exec rm -f '{}' \;
}
md5sums=('3ccd30bf2a5b50eaf7e2ed63f850f19d')

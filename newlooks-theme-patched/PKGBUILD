# Maintainer: megadriver <megadriver at gmx dot com>
# Based on newlooks-theme by Zuf, also in the AUR

pkgname=newlooks-theme-patched
pkgver=0.98
pkgrel=1
pkgdesc="Newlooks GTK2/GTK3 theme, patched to fix several annoyances"
url="http://gnome-look.org/content/show.php/Newlooks?content=126920"
license=('GPL')
arch=('any')
source=("http://gnome-look.org/CONTENT/content-files/126920-Newlooks_${pkgver}.tar.gz" gtk-widgets.patch)
md5sums=('6bcbe3f572181836150fe290bf06a254'
         '115f11a74ae2fa1fe70eb13eeb46c7f7')
optdepends=("gnome-themes-standard: Gets rid of the 'Theming engine adwaita not found' warning")
conflicts=('newlooks-theme')
provides=('newlooks-theme')

package() {
    # extract theme files
    mkdir -p $pkgdir/usr/share/themes
    tar xzf 126920-Newlooks_$pkgver.tar.gz -C $pkgdir/usr/share/themes

    # fix for the annoying GTK3 warnings
    cd $pkgdir/usr/share/themes
    patch -Np0 -i $srcdir/gtk-widgets.patch

    # fix for black on black tooltips in GTK3
    # new tooltip bg color matches the GTK2 one
    cd Newlooks/gtk-3.0
    sed -i 's/343434/e7f3fd/' settings.ini gtk.css
}

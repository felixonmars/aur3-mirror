# Maintainer: Edgar Kalkowski <eMail@edgar-kalkowski.de>

pkgname=adwaita-icon-theme-with-obsidian-cursors
pkgver=1.0
pkgrel=1
pkgdesc="Adwaita icon theme with dark obsidian cursor theme"
arch=(any)
depends=('hicolor-icon-theme' 'gtk-update-icon-cache')
makedepends=('intltool' 'icon-naming-utils')
provides=('adwaita-icon-theme' 'xcursor-obsidian')
conflicts=('adwaita-icon-theme' 'xcursor-obsidian')
url=('http://www.gnome.org' 'http://www.gnome-look.org/content/show.php/Obsidian+Cursors?content=73135')
license=('GPL')
install=adwaita-icon-theme.install
options=('!emptydirs')
source=('http://ftp.gnome.org/pub/gnome/sources/adwaita-icon-theme/3.14/adwaita-icon-theme-3.14.1.tar.xz'
        'http://www.gnome-look.org/CONTENT/content-files/73135-Obsidian.tar.bz2')
md5sums=('d03913d2d1624a6749a5c032082368fb'
         'bfac15c02e4a7a7c7e0225a86a4c9bfc')

build() {
    cd "adwaita-icon-theme-3.14.1"
    ./configure --prefix=/usr
    make
}

package() {
    cd "adwaita-icon-theme-3.14.1"
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir"/usr/share/icons/Adwaita/cursors/
    cp -R "$srcdir"/Obsidian/cursors "$pkgdir"/usr/share/icons/Adwaita/
}

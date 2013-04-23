# Maintainer: TingPing <tingping@tingping.se>

pkgname=gnome36-icon-theme
pkgver=3.6.2
pkgrel=1
pkgdesc='Old icon theme from gnome 3 before 3.8'
url='http://gnome.org/'
license=('GPL')
arch=('any')
depends=('hicolor-icon-theme' 'icon-naming-utils' 'gtk-update-icon-cache' 'gnome-icon-theme-symbolic')
makedepends=('intltool')
install='gnome-icon-theme.install'
source=("http://ftp.gnome.org/pub/GNOME/sources/gnome-icon-theme/3.6/gnome-icon-theme-$pkgver.tar.xz")
md5sums=('c7bf0c7cc3ca0c9d4ac120aedb9ab8af')
_themename='gnome-icon-theme'

build() {
    cd "$_themename-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$_themename-$pkgver"
    make DESTDIR="$pkgdir" install
    mv "$pkgdir/usr/share/icons/gnome" "$pkgdir/usr/share/icons/gnome36"
    rm -r "$pkgdir/usr/share/pkgconfig" "$pkgdir/usr/share/locale"
}


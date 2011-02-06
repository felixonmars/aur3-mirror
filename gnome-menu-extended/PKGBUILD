# Maintainer: Arkham <arkham at archlinux dot us>
# Contributor: Arkham <arkham at archlinux dot us>

pkgname=gnome-menu-extended
pkgver=1.2.2
pkgrel=1
pkgdesc="Gnome menu with KDE and OOo submenus for Gnome 2.10 or later."
arch=('any')
url="http://gtk-apps.org/content/show.php?content=73513"
license=('GPL' 'LGPL')
depends=('gnome-menus')
install=('gnome-menu-extended.install')
source=(http://gtk-apps.org/CONTENT/content-files/73513-${pkgname}-${pkgver}.tar.gz)
md5sums=('47f8b0ca74d49e40d2a5616cb9534298')

build() {
    cd $srcdir/$pkgname-$pkgver

    # Install all the data
    install -d $pkgdir/usr/share/{$pkgname,desktop-directories,pixmaps}
    install -m 644 $pkgname/* $pkgdir/usr/share/$pkgname/
    install -m 644 desktop-directories/* $pkgdir/usr/share/desktop-directories/
    install -m 644 pixmaps/* $pkgdir/usr/share/pixmaps/
    cp -a icons $pkgdir/usr/share
    find $pkgdir/usr/share/icons/ -type f -exec chmod 644 {} +

    # Install desktop and bin file
    install -Dm 644 applications/gnome-menu-extended.desktop \
        $pkgdir/usr/share/applications/gnome-menu-extended.desktop
    install -Dm 755 scripts/archlinux.sh $pkgdir/usr/bin/$pkgname.sh
}

# Maintainer: gmoraesalvarez <guilherme at moraesalvarez dot com
# Creator: the same
pkgname=gmawalpaper
pkgver=0.1
pkgrel=6
pkgdesc="Wallpaper changer for gnome"
arch=('x86_64')
depends=('gtk2' 'dconf')
url="https://github.com/gmoraesalvarez/gma-wallpaper"
license=('GPL2')
source=(https://github.com/gmoraesalvarez/gma-wallpaper/raw/master/gmawallpaper.tar.bz2)
sha512sums=('a8ec7f890ad4fc7aff9678e2fcfe70011714e172239da91fe30bb30abaea6f02bf6271ae981425981c7370e44469e97bf9ecad89af0710df5967ed0aa3c8a279')
package() {
    cd "${srcdir}"
    install -Dm755 gmawallpaper $pkgdir/usr/bin/gmawallpaper
    install -Dm755 gmawallpaper.desktop $pkgdir/usr/share/applications/gmawallpaper.desktop
}



# created 11:30:34 - 04/09/10
# Maintainer: watermel0n <billabonk at ymail dot com>

pkgname=gtk-theme-equinox-ubuntu
pkgver=1.30.2
pkgrel=1
pkgdesc="Two GTK and Metacity themes designed for Ubuntu 10.04 (Lucid Lynx): Equinox Ambient and Equinox Radient."
url="http://gnome-look.org/content/show.php/Equinox+Ubuntu+Themes?content=125664"
license=('GPL')
arch=('i686' 'x86_64')
depends=('gtk-engine-equinox')
source=("http://gnome-look.org/CONTENT/content-files/125664-equinox-ubuntu-themes-1.30.tar.gz")
md5sums=('c125e0626a7cb112390c1972bbe62b3d')

build() {
        mkdir -p ${pkgdir}/usr/share/themes
        tar xzf 125664-equinox-ubuntu-themes-1.30.tar.gz -C ${pkgdir}/usr/share/themes
        chown -R root:root ${pkgdir}/usr/share/themes
}

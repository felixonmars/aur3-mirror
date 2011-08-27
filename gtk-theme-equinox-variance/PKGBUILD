# created 16:14:20 - 26/06/10
# Maintainer: Frikilinux <frikilinux at frikilinux.com.ar>

pkgname=gtk-theme-equinox-variance
pkgver=1.30.2
pkgrel=1
pkgdesc="GTK and Metacity themes designed for the new version of Ubuntu 10.04"
url="http://gnome-look.org/content/show.php/Equinox+Radiance?content=121883"
license=('GPL')
arch=('any')
depends=('gtk-engine-equinox')
optdepends=('faenza-icon-theme: icons designed for this theme')
source=("http://gnome-look.org/CONTENT/content-files/121883-equinox-variance-themes.tar.gz")
sha256sums=('94ca60f8bf830be8cc4d828ad1e6b371bdb9be1d1a0ad3c53df8915b583b85a4')

build() {
        mkdir -p ${pkgdir}/usr/share/themes
        tar xzf 121883-equinox-variance-themes.tar.gz -C ${pkgdir}/usr/share/themes
        chown -R root:root ${pkgdir}/usr/share/themes
}

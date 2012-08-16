# Maintainer: Rax Garfield <admin at dvizho.ks.ua>

pkgname=gtk-theme-gommapiumalooks
pkgver=20071116
pkgrel=1
pkgdesc="A modified version of GumminaLooks with darker color scheme"
url="http://gnome-look.org/content/show.php?content=69913"
license=('GPL')
arch=('any')
depends=('gtk-engines')
source=('http://gnome-look.org/CONTENT/content-files/69913-gommapiumalooks.tar.gz')
md5sums=('8436860d15fcc948fb5e427faf901ff3')

build() {
    cd "${srcdir}"
    install -d -m755 "${pkgdir}/usr/share/themes"
    cp -ar gommapiumalooks "${pkgdir}/usr/share/themes"
}

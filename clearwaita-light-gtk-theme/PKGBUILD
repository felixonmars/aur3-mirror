# Maintainer: Mephisto Pheles <mephisto.pheles.nyan@gmail.com>

pkgname=clearwaita-light-gtk-theme
pkgver=0.1
pkgrel=1
pkgdesc="GTK2/GTK3 theme visually close to Clearlooks, without rounded widgets and updated openbox theme"
arch=('any')
url="http://www.jpfleury.net"
license=('GPL')
depends=('gtk-engines')
makedepends=()

source=("http://dl.dropbox.com/u/28281416/aur/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b8bb3b3939939d178448f086f79c173789c72a56c2e02855b86da6507e652a9b')

package() {
    # extract theme files
    mkdir -p "${pkgdir}"/usr/share/themes
    tar xzf ${pkgname}-${pkgver}.tar.gz -C "${pkgdir}"/usr/share/themes
}


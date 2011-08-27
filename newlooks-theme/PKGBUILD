# Maintainer: kontakt.zuf@gmail.com

pkgname=newlooks-theme
pkgver=0.98
pkgrel=1
pkgdesc="GNOME 3 Fallback light theme"
url="http://gnome-look.org/content/show.php/Newlooks?content=126920"
license=('GPL')
arch=('any')
makedepends=()
conflicts=()
source=("http://gnome-look.org/CONTENT/content-files/126920-Newlooks_${pkgver}.tar.gz")
sha256sums=('7f563dbbdeb28be583df6d6ba622d0e55247e009785059d61a4e8d234ec04dbe')

package() {
    # extract theme files
    mkdir -p "${pkgdir}"/usr/share/themes
    tar xzf 126920-Newlooks_${pkgver}.tar.gz -C "${pkgdir}"/usr/share/themes
}

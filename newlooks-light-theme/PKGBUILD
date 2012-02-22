# Maintainer: mephistopheles <mephisto.pheles.nyan @ gmail.com>

pkgname=newlooks-light-theme
pkgver=0.98
pkgrel=1
pkgdesc="GNOME 3 Fallback light theme without rounded gtk widgets"
url="http://gnome-look.org/content/show.php/Newlooks?content=126920"
license=('GPL')
arch=('any')
makedepends=()
conflicts=()
source=("http://dl.dropbox.com/u/28281416/aur/newlooks-light-${pkgver}.tar.gz")
sha256sums=('505cac89cfda9625eff938960fc3942b6e2ea17c789156260b05771e9091734a')

package() {
    # extract theme files
    mkdir -p "${pkgdir}"/usr/share/themes
    tar xzf newlooks-light-${pkgver}.tar.gz -C "${pkgdir}"/usr/share/themes
}

# Maintainer: Rob McCathie <korrode at gmail>

pkgname=metacity-theme-thinner
## pkgver corresponds to changelog notes at $url
pkgver=2.0
pkgrel=1
pkgdesc="A titleless Metacity theme with rounded corners"
arch=('any')
url="http://gnome-look.org/content/show.php?content=79753"
license=('GPL')
#depends=('')
#makedepends=('')
#optdepends=('')
#conflicts=('')
#provides=('')
#replaces=('')
#install="$pkgname".install
source=("http://gnome-look.org/CONTENT/content-files/79753-Thinner.tar.gz")
sha1sums=('6abba984657aab3bb822e54afca532e382b09f98')

package() {
  mkdir -p "${pkgdir}/usr/share/themes"
  cp -r "${srcdir}/Thinner" "${pkgdir}/usr/share/themes"
}

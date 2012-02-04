# Maintainer: Malina Salina <bluesilence at hotm co uk>

pkgname=buuf-nestort-icontheme
_pkgname=Buuf-Nestort
pkgver=1.05
pkgrel=1
pkgdesc="An icon theme for Gnome based on the Buuf iconset by Mattahan"
arch=('any')
url="http://gnome-look.org/content/show.php/Buuf-based+Nestort?content=143347"
license=('Creative Commons by-nc-sa')
depends=('hicolor-icon-theme')
optdepends=()
source=(http://dl.dropbox.com/u/21337061/${_pkgname}-$pkgver.tar.gz)
md5sums=('8cd80da82d4ea313371befddd76f599e')

package() {   
mkdir -p "${pkgdir}/usr/share/icons/${_pkgname}/"
  cp -r ${srcdir}/$_pkgname/* "${pkgdir}/usr/share/icons/${_pkgname}/"
}


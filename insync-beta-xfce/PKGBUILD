# Maintainer: Artur Wrona <arturwrona91@gmail.com>

pkgname=insync-beta-xfce
pkgver=0.10.11
pkgrel=1
pkgdesc="Thunar integration for insync"
url="https://support.insynchq.com/forums/discussion/2208/new-insync-version-1-0-22-with-do-not-convert-feature-headless-app"
license=('custom:insync')
options=(!strip)
arch=('any')

depends=("insync-beta" "thunarx-python")
source=("${pkgname}-${pkgver}.deb::http://s.insynchq.com/builds/${pkgname}_${pkgver}_all.deb")
sha256sums=("c3aa82539937c65bddee31f8080d02e5cc0da87697c68005ec7cca5dcb14fe4c")
noextract=("${pkgname}-${pkgver}.deb")

package() {
   cd $srcdir
   ar x ${pkgname}-${pkgver}.deb
   tar xvf data.tar.gz
   cp -rp usr $pkgdir
}

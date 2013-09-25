# Maintainer: Artur Wrona <arturwrona91@gmail.com>

pkgname=insync-beta-mate
pkgver=0.10.11
pkgrel=1
pkgdesc="Caja integration for insync"
url="https://support.insynchq.com/forums/discussion/2208/new-insync-version-1-0-22-with-do-not-convert-feature-headless-app"
license=('custom:insync')
options=(!strip)
arch=('any')

depends=("insync-beta" "python2-caja")
source=("${pkgname}-${pkgver}.deb::http://s.insynchq.com/builds/${pkgname}_${pkgver}_all.deb")
sha256sums=("f30a94701e91ec5ad14f492f53f59a667643bfc5038ed70e39af7fb398c3900e")
noextract=("${pkgname}-${pkgver}.deb")

package() {
   cd $srcdir
   ar x ${pkgname}-${pkgver}.deb
   tar xvf data.tar.gz
   cp -rp usr $pkgdir
}

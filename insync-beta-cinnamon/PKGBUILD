# Maintainer: Artur Wrona <arturwrona91@gmail.com>

pkgname=insync-beta-cinnamon
pkgver=0.10.11
pkgrel=1
pkgdesc="Nemo integration for insync"
url="https://support.insynchq.com/forums/discussion/2208/new-insync-version-1-0-22-with-do-not-convert-feature-headless-app"
license=('custom:insync')
options=(!strip)
arch=('any')

depends=("insync-beta" "nemo" "nemo-python-git")
source=("${pkgname}-${pkgver}.deb::http://s.insynchq.com/builds/${pkgname}_${pkgver}_all.deb")
sha256sums=("bcf56ec6a862acfecce59b54b0cd068886609519af2dc486fbe20e610264088b")
noextract=("${pkgname}-${pkgver}.deb")

package() {
   cd $srcdir
   ar x ${pkgname}-${pkgver}.deb
   tar xvf data.tar.gz
   cp -rp usr $pkgdir
}

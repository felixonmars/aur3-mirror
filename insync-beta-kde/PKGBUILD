# Maintainer: Artur Wrona <arturwrona91@gmail.com>

pkgname=insync-beta-kde
pkgver=0.10.11
pkgrel=1
pkgdesc="Dolphin integration for insync"
url="https://support.insynchq.com/forums/discussion/2208/new-insync-version-1-0-22-with-do-not-convert-feature-headless-app"
license=('custom:insync')
options=(!strip)
arch=('any')

depends=("insync-beta" "kdebindings-python2" "kdebase-workspace")
source=("${pkgname}-${pkgver}.deb::http://s.insynchq.com/builds/${pkgname}_${pkgver}_all.deb")
sha256sums=("0abadd9aa6106ec9c1399a7996f4cd499040c36ac483688dcb4155c6f6cb2dcd")
noextract=("${pkgname}-${pkgver}.deb")
install=$pkgname.install

package() {
   cd $srcdir
   ar x ${pkgname}-${pkgver}.deb
   tar xvf data.tar.gz
   cp -rp usr $pkgdir
}

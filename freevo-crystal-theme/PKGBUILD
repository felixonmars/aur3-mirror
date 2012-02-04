# Contributor: Johannes Zellner <webmaster@nebulon.de>

pkgname=freevo-crystal-theme
pkgver=0.11
pkgrel=1
pkgdesc="Crystaltheme for freevo, an open-source home theatre PC platform"
url="http://freevo.sourceforge.net/"
depends=('freevo')
source=(http://x.nebulon.de/freevo-crystal-theme-$pkgver.tgz)
md5sums=('7a43013f7b9698b7ffef18fb7ed8a03c')
build() {
  cd $startdir/src/freevo-crystal-theme-$pkgver
  python setup.py build
  python setup.py install --prefix=$startdir/pkg/usr
}

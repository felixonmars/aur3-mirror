# Contributor: Johannes Zellner <webmaster@nebulon.de>

pkgname=freevo-weather-plugin
pkgver=0.8
pkgrel=1
pkgdesc="Weatherforecastplugin for freevo, an open-source home theatre PC platform"
url="http://freevo.sourceforge.net/"
depends=('freevo')
source=(http://x.nebulon.de/Freevo-Weather-$pkgver.tar.gz)
md5sums=('a7f5bdc0723c4151582547f6487df86f')
build() {
  cd $startdir/src/Freevo-Weather-$pkgver
  python setup.py build
  python setup.py install --prefix=$startdir/pkg/usr
}

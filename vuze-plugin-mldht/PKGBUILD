# Maintainer: Pedro Alejandro López-Valencia <palopezv@gmail.com>
#
# This PKGBUILD is provided under the BSD 2-clause license.
# Please see the file LICENSE for details.
#
# Patches welcome. Send pull requests to
# https://github.com/vorbote/vuze-plugin-mldht

pkgname=vuze-plugin-mldht
pkgver=1.4.2
pkgrel=3
pkgdesc="A Mainline DHT plugin for Vuze. Talk DHT to µTorrent clients."
arch=('any')
url=http://azureus.sourceforge.net/plugin_details.php?plugin=mlDHT
license=('GPL2')
depends=('vuze')
options=(!strip)
source=("http://azureus.sourceforge.net/plugins/mlDHT_${pkgver}.jar")
noextract=("mlDHT_${pkgver}.jar")
md5sums=('e60080ab4c38d648821d269c71e653e5')

build () {
	cd "$srcdir"
	install -Dm644 mlDHT_${pkgver}.jar "${pkgdir}/usr/share/vuze/plugins/mlDHT/mlDHT_${pkgver}.jar"
}

# Maintainer: Pedro Alejandro López-Valencia <palopezv at gmail.com>
#
# This file is provided under the BSD 2-clause license.
# <http://opensource.org/licenses/BSD-2-Clause>
#
# Patches welcome. Send pull requests to
# https://github.com/vorbote/vuze-plugin-mldht

pkgname=vuze-plugin-mldht
pkgver=1.4.3
pkgrel=1
pkgdesc="A Mainline DHT plugin for Vuze. Talk DHT to µTorrent clients."
arch=('any')
url=http://azureus.sourceforge.net/plugin_details.php?plugin=mlDHT
license=('GPL2')
depends=('vuze')
options=(!strip)
source=("http://azureus.sourceforge.net/plugins/mlDHT_${pkgver}.jar")
noextract=("mlDHT_${pkgver}.jar")
md5sums=('d7a31ed083181d296dca0ba61299f110')

build () {
	cd "$srcdir"
	install -Dm644 mlDHT_${pkgver}.jar "${pkgdir}/usr/share/vuze/plugins/mlDHT/mlDHT_${pkgver}.jar"
}

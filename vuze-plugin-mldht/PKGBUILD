# Maintainer: Pedro Alejandro López-Valencia <palopezv at gmail.com>
#
# This file is provided under the BSD 2-clause license.
# <http://opensource.org/licenses/BSD-2-Clause>
#
# Patches welcome. Send pull requests to
# https://github.com/vorbote/vuze-plugin-mldht

pkgname=vuze-plugin-mldht
pkgver=1.4.5
pkgrel=2
pkgdesc="Mainline DHT for Vuze. Talk DHT to µTorrent, Transmission, etc."
arch=('any')
url=http://azureus.sourceforge.net/plugin_details.php?plugin=mlDHT
license=('GPL2')
options=(!strip)
source=("http://azureus.sourceforge.net/plugins/mlDHT_${pkgver}.jar")
noextract=("mlDHT_${pkgver}.jar")
md5sums=('d86cdd93714a75ce3a491b9508c7b62a')

build () {
	cd "$srcdir"
	install -Dm644 mlDHT_${pkgver}.jar "${pkgdir}/usr/share/vuze/plugins/mlDHT/mlDHT_${pkgver}.jar"
}

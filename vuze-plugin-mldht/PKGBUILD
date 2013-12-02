# Maintainer: Pedro Alejandro López-Valencia <palopezv at gmail.com>
#
# This file is provided under the BSD 2-clause license.
# <http://opensource.org/licenses/BSD-2-Clause>
#
# Patches welcome. Send pull requests to
# https://github.com/palopezv/vuze-plugin-mldht

pkgname=vuze-plugin-mldht
pkgver=1.5.0
pkgrel=1
pkgdesc="Mainline DHT for Vuze. Talk DHT to µTorrent, Transmission, etc."
arch=('any')
url=http://azureus.sourceforge.net/plugin_details.php?plugin=mlDHT
license=('GPL2')
depends=('vuze')
options=(!strip)
source=("http://azureus.sourceforge.net/plugins/mlDHT_${pkgver}.jar")
noextract=("mlDHT_${pkgver}.jar")
sha256sums=('79128552241bf6731c2b8f6e5a52c3eb0d1658578cf3b8befd39a3431da22c8f')

package () {
	cd "$srcdir"
	install -Dm644 mlDHT_${pkgver}.jar "${pkgdir}/usr/lib/vuze/plugins/mlDHT/mlDHT_${pkgver}.jar"
}


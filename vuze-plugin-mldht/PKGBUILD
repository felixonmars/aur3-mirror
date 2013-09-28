# Maintainer: Pedro Alejandro López-Valencia <palopezv at gmail.com>
#
# This file is provided under the BSD 2-clause license.
# <http://opensource.org/licenses/BSD-2-Clause>
#
# Patches welcome. Send pull requests to
# https://github.com/palopezv/vuze-plugin-mldht

pkgname=vuze-plugin-mldht
pkgver=1.4.8
pkgrel=1
pkgdesc="Mainline DHT for Vuze. Talk DHT to µTorrent, Transmission, etc."
arch=('any')
url=http://azureus.sourceforge.net/plugin_details.php?plugin=mlDHT
license=('GPL2')
depends=('vuze')
options=(!strip)
source=("http://azureus.sourceforge.net/plugins/mlDHT_${pkgver}.jar")
noextract=("mlDHT_${pkgver}.jar")
sha256sums=('50abf5ec474dee262d2e45bcecb6c9772de3132d5c9be6d228366ed5040dce71')

package () {
	cd "$srcdir"
	install -Dm644 mlDHT_${pkgver}.jar "${pkgdir}/usr/lib/vuze/plugins/mlDHT/mlDHT_${pkgver}.jar"
}


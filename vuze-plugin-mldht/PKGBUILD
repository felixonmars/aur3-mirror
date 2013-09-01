# Maintainer: Pedro Alejandro López-Valencia <palopezv at gmail.com>
#
# This file is provided under the BSD 2-clause license.
# <http://opensource.org/licenses/BSD-2-Clause>
#
# Patches welcome. Send pull requests to
# https://github.com/palopezv/vuze-plugin-mldht

pkgname=vuze-plugin-mldht
pkgver=1.4.6
pkgrel=1
pkgdesc="Mainline DHT for Vuze. Talk DHT to µTorrent, Transmission, etc."
arch=('any')
url=http://azureus.sourceforge.net/plugin_details.php?plugin=mlDHT
license=('GPL2')
depends=('vuze')
options=(!strip)
source=("http://azureus.sourceforge.net/plugins/mlDHT_${pkgver}.jar")
noextract=("mlDHT_${pkgver}.jar")
sha256sums=('f98fe350996af49e18f8c7c4f47e262edf3bd87113540f9ad83bdfd73b8deac7')

package () {
	cd "$srcdir"
	install -Dm644 mlDHT_${pkgver}.jar "${pkgdir}/usr/share/vuze/plugins/mlDHT/mlDHT_${pkgver}.jar"
}


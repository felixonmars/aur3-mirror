# Maintainer: Pedro Alejandro López-Valencia <palopezv at gmail.com>
#
# This file is provided under the BSD 2-clause license.
# <http://opensource.org/licenses/BSD-2-Clause>
#
# Patches welcome. Send pull requests to
# https://github.com/vorbote/vuze-plugin-i2p

pkgname=vuze-plugin-i2p
pkgver=0.3.2
pkgrel=1
pkgdesc="Vuze plugin for the I2P darknet network. Follow the White Rabbit into its hole."
arch=('any')
url=http://azureus.sourceforge.net/plugin_details.php?plugin=azneti2p
license=('GPL2')
depends=('vuze')
options=(!strip)
source=("http://azureus.sourceforge.net/plugins/azneti2p_${pkgver}.jar")
noextract=("azneti2p_${pkgver}.jar")
md5sums=('d7c49dcca24a0a30e1480e908ffc1f23')

build () {
	cd "$srcdir"
	install -Dm644 azneti2p_${pkgver}.jar "${pkgdir}/usr/share/vuze/plugins/I2P/azneti2p_${pkgver}.jar"
}

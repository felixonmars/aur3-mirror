# Maintainer: juankfree <juan77.sonic at gmail dot com>
pkgname=razer-blackwidow-ultimate-lite
pkgver=0.0.5
pkgrel=1
pkgdesc="Enables M1-M5 and FN keys in Linux for the Razer BlackWidow Ultimate keyboard (The Lite version doesn't run automatically.)"
arch=('any')
url="https://github.com/juankfree/razer-blackwidow-ultimate"
license=('GPL2')
depends=('python-pyusb' 'xorg-xmodmap')
provides=('razer-blackwidow-ultimate-lite')
conflicts=('razer-blackwidow-macro-scripts' 'razer-blackwidow-ultimate')
options=('!strip')
install="razer-blackwidow-ultimate-lite.install"
source=('https://github.com/juankfree/razer-blackwidow-ultimate/raw/94073c2e14785ba65f638362b672c9336c7624f4/razer-blackwidow-ultimate.py'
		'https://github.com/juankfree/razer-blackwidow-ultimate/raw/94073c2e14785ba65f638362b672c9336c7624f4/razer-blackwidow-ultimate.sh'
)
md5sums=('f28c9a3078c51e68fdf3478aaa26ab34' '6ba8808c6c2a18b25384ccae32167cba')
package() {
	install -Dm755 "${srcdir}/razer-blackwidow-ultimate.py" "${pkgdir}/usr/bin/razer-blackwidow-ultimate.py"
	install -Dm755 "${srcdir}/razer-blackwidow-ultimate.sh" "${pkgdir}/usr/bin/razer-blackwidow-ultimate"
}

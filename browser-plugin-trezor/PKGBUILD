# Maintainer: Fabian Schuh <mail@xeroc.org>
# Mod 11/01/2015: Borja R <borja@libcrack.so>
pkgname=browser-plugin-trezor
pkgver=1.0.5
pkgrel=3
pkgdesc="The Browser Plugin for the first Hardware Bitcoin Wallet."
arch=('i686' 'x86_64')
url="https://mytrezor.com/"
license=('unknown')
makedepends=('rpmextract')
depends=('firefox')
provides=('browser-plugin-trezor')
options=('emptydirs')
source_x86_64=("https://mytrezor.com/data/plugin/1.0.5/browser-plugin-trezor-${pkgver}.x86_64.rpm")
sha256sums_x86_64=('4df79f0c122adc44590d4dde82a31899a59307f24e285d2c980780f0b966fa5d')
source_i686=("https://mytrezor.com/data/plugin/1.0.5/browser-plugin-trezor-${pkgver}.i386.rpm")
sha256sums_i686=('41bc847ada77cd169f0c753c1e3f052216b2bbbbe30893db05f0a511e8675e18')

package() {
    cd ${srcdir}

    install -D -m 644 \
        lib/udev/rules.d/51-trezor-udev.rules \
        ${pkgdir}/usr/lib/udev/rules.d/51-trezor-udev.rules

    install -D -m 755 \
        usr/lib*/mozilla/plugins/npBitcoinTrezorPlugin.so \
        ${pkgdir}/usr/lib/mozilla/plugins/npBitcoinTrezorPlugin.so
}

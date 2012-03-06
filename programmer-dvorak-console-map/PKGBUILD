# Maintainer: Lawrence Brogan <larryv2.0[at]gmail[dot]com>
pkgname=programmer-dvorak-console-map
pkgver=1.2.1
pkgrel=0
pkgdesc="Variant of the Dvrorak layout designed for programmers"
url="http://www.kaufmann.no/roland/dvorak/"
arch=('x86_64' 'i686')
license=('custom')
depends=()
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("http://www.kaufmann.no/downloads/linux/dvp-1_2_1.map.gz"
        "LICENSE")
md5sums=('8cde9c8f6b4de6c7c2ebb27589a5116e'
         '4e9137e3c0e7d5c94477d895a7044b02')

package() {
	install -m 644 -D $srcdir/LICENSE $pkgdir/usr/share/licenses/programmer-dvorak-console-map/LICENSE || return 1
	install -m 644 -D "dvp-1_2_1.map.gz" $pkgdir/usr/share/kbd/keymaps/i386/dvorak/dvp.map.gz || return 1
}

# vim:set ts=2 sw=2 et:

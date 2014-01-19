# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs

pkgname=cinnamon-extension-maximus-cinnamon
pkgver=5
pkgrel=13
pkgdesc="Undecorate maximized windows, like Ubuntu's old 'Maximus' package. See readme at extension homepage."
url="http://cinnamon-spices.linuxmint.com/extensions/view/19"
arch=('any')
license=('GPL3')
groups=('cinnamon-extensions')
depends=('cinnamon')
source=("http://cinnamon-spices.linuxmint.com/uploads/extensions/03AG-9ISW-9DB1.zip")
md5sums=('8cfc124b1497d8ac3d4647e90093e120')

_uuid="maximus-cinnamon@mathematical.coffee.gmail.com"

build() {
    cd "${srcdir}/${_uuid}"

    msg "Fixing the extension to Cinnamon 2.0"
    sed -i 's_"1.4", "1.5", "1.5.1", "1.5.2"_"2.0", "2.0.14"_' metadata.json

    msg "Fixing the extension to work with Cinnamon 2.0"
    sed -i 's_0x2, 0x0, 0x0, 0x0, 0x0_0x2, 0x0, 0x2, 0x0, 0x0_' extension.js
}

package() {
    cd "${srcdir}"
    find ${_uuid}/ -type f -exec install -Dm644 '{}' "${pkgdir}/usr/share/cinnamon/extensions/{}" \;
}

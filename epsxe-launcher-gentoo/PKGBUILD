# Contributor: robsonpeixoto -- contact via Arch Linux forum or AUR
# Contributor: quantax -- contact via Arch Linux forum or AUR

pkgname=epsxe-launcher-gentoo
pkgver=1
pkgrel=1
pkgdesc="Bash launcher for the Enhanced PSX Emulator."
arch=(any)
url="http://www.epsxe.com/"
license=('custom')
depends=('bash' 'epsxe')
conflicts=('epsxe-launcher-python' 'epsxe-launcher-bash')
source=('epsxe')
md5sums=('651df9ca6ee5a77a94fc7ea41b2570c8')

build() {
    cd "${srcdir}"
}

package() {
    install --mode=755 -D epsxe "${pkgdir}/usr/bin/epsxe"
}

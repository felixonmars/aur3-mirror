# Maintainer: blomblom <blomblom@openmailbox.org>

pkgname='wicd-eduroam-kl'
pkgver=1
pkgrel=1
pkgdesc="Eduroam (TU Kaiserslautern) template for Wicd network manager"
arch=('any')
url="http://wicd.sourceforge.net/"
license=('WTFPL')
groups=()
depends=('wicd' 'ca-certificates')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
install=eduroam-kl.install
source=(eduroam-kl)
noextract=()
md5sums=('577f7edf55b198d065537427931a470d')

package(){
    install -Dm 644 eduroam-kl $pkgdir/etc/wicd/encryption/templates/eduroam-kl
}

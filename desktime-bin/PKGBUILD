# Maintainer: Žiga Lausegger <ziga.lausegger@gmail.com>

pkgname=desktime-bin
pkgver=1.32
pkgrel=1
pkgdesc="Desktime linux client - https://desktime.com"
arch=('i686' 'x86_64')
url="http://desktime.com/updates/linux/beta/desktime-linux_${pkgver}_x64.deb"
license=('EULA')
groups=('extra')
depends=()
source=("$url" "desktime-bin.install")
md5sums=('0a8ae92d768c4c87aaac2ac5a7099483' 'ac0b118f49b5ee4b4641dbb04455f1ea')

package() {
    tar -xf data.tar.xz -C "${pkgdir}"
}

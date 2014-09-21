# Maintainer: DeadSurgeon42 <deadsurgeon42 at gmail dot com>
pkgname=powertop-autotune-systemd
pkgver=1
pkgrel=4
pkgdesc="Systemd service file for autotuning with PowerTOP"
arch=('any')
url="https://wiki.archlinux.org/index.php/Powertop"
license=('GPL')
depends=('powertop')
source=powertop-autotune.service
md5sums=('a9d776a30b80a324fbe14d3eb794298e')
install=notice.install

package() {
mkdir -p $pkgdir/etc/systemd/system/
cp $srcdir/powertop-autotune.service $pkgdir/etc/systemd/system/
}


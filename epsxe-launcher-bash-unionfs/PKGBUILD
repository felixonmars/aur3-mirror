# Maintainer: Shaun Westmacott <xyem@electricjungle.org>

pkgdesc='A bash launcher for ePSXe which uses unionfs'
pkgname=epsxe-launcher-bash-unionfs
pkgrel=1
pkgver=20130311

arch=('any')
conflicts=('epsxe-launcher-python','epsxe-launcher-gentoo')
depends=(unionfs-fuse)
license=('GPL')
md5sums=('db6c6b503c0726f712898ba951011f95')
source=(epsxe)
url="https://bbs.archlinux.org/viewtopic.php?pid=1238641"

package() {
    install --mode=755 -D epsxe "${pkgdir}/usr/bin/epsxe"
}

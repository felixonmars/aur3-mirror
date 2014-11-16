# $Id: PKGBUILD 112045 2014-05-29 00:10:5 $
# Maintainer: yafeng <yafengabc@gmail.com>

pkgname=btrfs-autodegraded
pkgver=1.0
pkgrel=1
pkgdesc="mkinitcpio hook auto degraded for btrfs-based root devices"
arch=('any')
url='https://github.com/yafengabc/btrfs-autodegraded'
license=('GPL3')
depends=('btrfs-progs')
makedepends=('git')
optdepends=()
source=("git://github.com/yafengabc/btrfs-autodegraded.git")
install=btrfsauto.install

package() {
	
	#mkdir ${pkgdir}/usr
	#mkdir ${pkgdir}/usr/share
	#mkdir ${pkgdir}/usr/share/transmission
	#tar vxf transmission-control-full.tar.gz -C ${pkgdir}/usr/share/transmission/
	#mv ${pkgdir}/usr/share/transmission/web/index.html ${pkgdir}/usr/share/transmission/web/index.htm
	install -o root -g root -D ${srcdir}/${pkgname}/src/btrfs-autodegraded-hook ${pkgdir}/usr/lib/initcpio/hooks/btrfsauto
	install -o root -g root -D ${srcdir}/${pkgname}/src/btrfs-autodegraded-install ${pkgdir}/usr/lib/initcpio/install/btrfsauto
}
md5sums=('SKIP')

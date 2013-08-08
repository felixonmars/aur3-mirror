# Maintainer: Patryk Jaworski <regalis@regalis.com.pl>

pkgname=mkinitcpio-squashfs-git
pkgver=0.1
pkgrel=1
pkgdesc="SquashFS root support for mkinitcpio (remote and local image locations supported)"
arch=("any")
url="https://github.com/Regalis/mkinitramfs-squashfs"
license=("GPL3")
depends=("pv" "wget" "mkinitcpio" "findutils")
makedepends=("git")
optdepends=("mkinitcpio-nfs-utils: downloading SquashFS images from remote locations")
conflicts=("mkinitcpio-squashfs")
source=("git://github.com/Regalis/mkinitramfs-squashfs.git")
md5sums=('SKIP')
_gitname=mkinitramfs-squashfs

pkgver() {
	cd "${_gitname}"
	git describe --always | sed 's|-|.|g'
}

package() {
	cd "${_gitname}"
	make install DESTDIR="${pkgdir}"
}

# Contributor: American_Jesus <american.jesus.pt AT gmail DOT com>
# Maintainer: Erik Johnson <palehose at gmail dot com>

pkgname=grub2-theme-archxion-widescreen
_pkgname=Archxion
pkgver=1.0
pkgrel=1
pkgdesc="Archxion theme modification for widescreen displays"
url="https://github.com/Generator/Grub2-themes"
arch=('any')
license=('GPLv3')
depends=('grub-common')
install=${pkgname}.install
source=("https://github.com/downloads/Generator/Grub2-themes/$_pkgname.tar.bz2"
        widescreen.patch)
md5sums=(b994445c08e81c00d91c727e06053f44
         3ca19cf3f9535f3ddc15437a63019652)

build() {
  cd "${srcdir}"
  patch -Np0 -i widescreen.patch
  find . -type f -exec install -D -m644 {} ${pkgdir}/boot/grub/themes/{} \;
  mv ${pkgdir}/boot/grub/themes/${_pkgname} ${pkgdir}/boot/grub/themes/${_pkgname}-widescreen
}

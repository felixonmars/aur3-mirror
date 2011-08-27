# Maintainer: Florian Léger <florian6 dot leger at laposte dot net>

pkgname=update-fstab
pkgver=20100814
pkgrel=1
pkgdesc='Script for flexible /etc/fstab.d configuration.'
arch=('any')
url='http://forums.gentoo.org/viewtopic.php?p=6364143'
license=('GPL')
source=("update-fstab.sh")
md5sums=('e1060e04f419bdb003e96a4b528f40c9')

build() {
  install -D -m755 "${srcdir}/update-fstab.sh" "${pkgdir}/usr/bin/update-fstab"
}

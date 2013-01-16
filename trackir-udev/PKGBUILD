# Maintainer: blackleg <hectorespertpardo@gmail.com>

pkgname=trackir-udev
pkgver=1
pkgrel=1
pkgdesc='Udev rules to use Track IR in linuxtrack'
arch=('any')
url="http://code.google.com/p/linux-track/"
license=('MIT License')
source=('51-TIR.rules')
install='trackir-udev.install'

md5sums=('a33472cbb7300bac8f105c3b7c8c841f')

package() {
  mkdir -p $pkgdir/usr/lib/udev/rules.d/
  cp $srcdir/51-TIR.rules $pkgdir/usr/lib/udev/rules.d/51-TIR.rules
  chmod a+r $pkgdir/usr/lib/udev/rules.d/51-TIR.rules
}



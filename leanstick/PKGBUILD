# Contributor: Mark Pustjens <pustjens@dds.nl>
pkgname=leanstick
pkgver=0.2
pkgrel=1
pkgdesc="Translate joystick movements into keystrokes. Similar to joy2key."
arch=('i686' 'x86_64')
url="http://yiannnos.com/leanstick"
license=('GPLV2')
depends=(perl)
source=("http://yiannnos.com/download/leanstick-${pkgver}.tar.gz")
md5sums=('3c1cd00f65b9545afb43ae9f902cb449')

build() {
  install -d ${pkgdir}/usr/share/leanstick/
  install -m0755 ${srcdir}/leanstick-${pkgver}/leanstick.pl ${pkgdir}/usr/share/leanstick/
  install ${srcdir}/leanstick-${pkgver}/README ${pkgdir}/usr/share/leanstick/
  install ${srcdir}/leanstick-${pkgver}/COPYING ${pkgdir}/usr/share/leanstick/
  install ${srcdir}/leanstick-${pkgver}/sampleconfig ${pkgdir}/usr/share/leanstick/
  install -d ${pkgdir}/usr/bin/
  cd ${pkgdir}/usr/bin
  ln -s ../../usr/share/leanstick/leanstick.pl leanstick
}

# vim:set ts=2 sw=2 et:

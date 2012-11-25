# Contributor: Mark Pustjens <pustjens@dds.nl>
pkgname=gleanstick
pkgver=0.2
pkgrel=1
pkgdesc="GUI for leanstick, which translates joystick movements into keystrokes"
arch=('i686' 'x86_64')
url="http://yiannnos.com/gleanstick"
license=('GPLV2')
depends=(perl)
source=("http://yiannnos.com/download/gleanstick-${pkgver}.tar.gz"
        "gleanstick.sh")
md5sums=('e549c3d7fcedfb75aafae68cc2316bcd'
         '35b43f067065b3cedd86804a68544522')

build() {
  install -d ${pkgdir}/usr/share/gleanstick/
  install -d ${pkgdir}/usr/share/gleanstick/actions/
  install -m0755 ${srcdir}/gleanstick-${pkgver}/gleanstick.py ${pkgdir}/usr/share/gleanstick/
  install -m0755 ${srcdir}/gleanstick.sh ${pkgdir}/usr/share/gleanstick/
  install ${srcdir}/gleanstick-${pkgver}/README ${pkgdir}/usr/share/gleanstick/
  install ${srcdir}/gleanstick-${pkgver}/gleanstick.png ${pkgdir}/usr/share/gleanstick/
  install ${srcdir}/gleanstick-${pkgver}/gleanstick-red.png ${pkgdir}/usr/share/gleanstick/
  install ${srcdir}/gleanstick-${pkgver}/actions/*.xml ${pkgdir}/usr/share/gleanstick/actions/
  install -d ${pkgdir}/usr/bin/
  cd ${pkgdir}/usr/bin
  ln -s ../../usr/share/gleanstick/gleanstick.sh gleanstick
}

# vim:set ts=2 sw=2 et:

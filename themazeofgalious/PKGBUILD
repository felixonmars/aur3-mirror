# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=themazeofgalious
pkgver=0.63.1548
_realver=0.63-1548
pkgrel=1
pkgdesc="A remake of the MSX The Maze of Galious game"
arch=(i686 x86_64)
url="http://mog.jorito.net"
license=('GPL2')

depends=('sdl_image' 'sdl_mixer' 'sdl_sound')
makedepends=('')

source=(http://braingames.jorito.net/mog/downloads/mog.src_${_realver}.tgz)
md5sums=('68604c258ce7347662777d853d895769')

build() {
  cd ${srcdir}/mog-${pkgver}

  # remove debugging messages in home directory
#  sed -i '4d' ${srcdir}/${pkgname}-${pkgver}/src/debug.h || return 1

  make || return 1

  install -d ${pkgdir}/usr/share/mog/
  install -d ${pkgdir}/usr/share/applications/
  install -d ${pkgdir}/usr/bin/

  cp -r mog graphics rooms sound leeme.txt liesmich.txt readme.txt MoG-FAQ.txt LICENSE ${pkgdir}/usr/share/mog/
  cat build/linux/mog.desktop | \
    sed s#mog.png#/usr/share/pixmaps/mog.png#g > \
    ${pkgdir}/usr/share/applications/mog.desktop
  install -D build/linux/mog.png \
    ${pkgdir}/usr/share/pixmaps/mog.png
  
  echo "#!/bin/bash" > ${pkgdir}/usr/bin/mog
  echo "cd /usr/share/mog/" >> ${pkgdir}/usr/bin/mog
  echo "exec /usr/share/mog/mog" >> ${pkgdir}/usr/bin/mog
  chmod 755 ${pkgdir}/usr/bin/mog
}


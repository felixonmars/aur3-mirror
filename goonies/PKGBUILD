# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Juan Matias Granda <insulae@gmail.com>

pkgname=goonies
pkgver=1.4.1528
pkgrel=4
pkgdesc="A remake of the MSX Goonies game"
arch=('i686' 'x86_64')
url="http://goonies.jorito.net/"
license=('none')
depends=('sdl_image' 'sdl_mixer' 'gcc-libs' 'mesa')
source=(http://braingames.jorito.net/goonies/downloads/$pkgname.src_$pkgver.tgz
	fix-linking-with-lm.patch)
md5sums=('7c220958a0766fb716d2d0081c81e8bd'
         '974df0d5cb54502b920a9052baeeb1ec')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # remove debugging messages in home directory
  sed -i '4d' src/debug.h
  # fix linking
  patch -Np1 -i ../fix-linking-with-lm.patch

  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  install -d ${pkgdir}/usr/share/goonies/
  install -d ${pkgdir}/usr/bin/
  install -d ${pkgdir}/usr/share/applications/

  install -D goonies ${pkgdir}/usr/share/goonies/
  cp -r graphics maps sound ${pkgdir}/usr/share/goonies/
  cat build/linux/goonies.desktop | \
    sed s#goonies.png#/usr/share/pixmaps/goonies.png#g > \
    ${pkgdir}/usr/share/applications/goonies.desktop
  install -D build/linux/goonies.png \
    ${pkgdir}/usr/share/pixmaps/goonies.png
  
  echo "#!/bin/bash" > ${pkgdir}/usr/bin/goonies
  echo "cd /usr/share/goonies/" >> ${pkgdir}/usr/bin/goonies
  echo "exec /usr/share/goonies/goonies" >> ${pkgdir}/usr/bin/goonies
  chmod 755 ${pkgdir}/usr/bin/goonies
}

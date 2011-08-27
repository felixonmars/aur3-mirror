# Maintainer: kfgz <kfgz at interia dot pl>

pkgname=lightsmark-bin
pkgver=2008.2.0
pkgrel=3
arch=('i686' 'x86_64')
pkgdesc="Multiplatform benchmark/demo with realtime global illumination and penumbra shadows"
url="http://dee.cz/lightsmark/"
license=('creative-commons')
depends=('freeimage' 'glew1.5' 'glut')
source=(http://dee.cz/lightsmark/Lightsmark${pkgver}.tar.bz2 
        lightsmark)
md5sums=('325707b95daab878512dbb27271b1565'
         '8fd6d8f14071bd62ff9a12a15649f7e8')

_dstdir=Lightsmark${pkgver}

package() {
  install -m755 -D lightsmark ${pkgdir}/usr/bin/lightsmark
  cd ${srcdir}/Lightsmark${pkgver}
  
  install -dm755 ${pkgdir}/opt/${_dstdir}/data/{maps,music,objects,scenes/wop_padattic,shaders}
  cd data/maps
  install -m644 * ${pkgdir}/opt/${_dstdir}/data/maps/
  cd ../music
  install -m644 * ${pkgdir}/opt/${_dstdir}/data/music/
  cd ../objects
  install -m644 * ${pkgdir}/opt/${_dstdir}/data/objects/
  cd ../scenes/wop_padattic
  install -m644 * ${pkgdir}/opt/${_dstdir}/data/scenes/wop_padattic
  cd ../../shaders
  install -m644 * ${pkgdir}/opt/${_dstdir}/data/shaders/
  
  cd ..
  install -m644 Lightsmark2008.cfg ${pkgdir}/opt/${_dstdir}/data/
  cd ..
	
  if [ `uname -m` = "x86_64" ]; then
   install -dm755 ${pkgdir}/opt/${_dstdir}/bin/pc-linux64
   cd bin/pc-linux64
   install -m755 * ${pkgdir}/opt/${_dstdir}/bin/pc-linux64
  else
   install -dm755 ${pkgdir}/opt/${_dstdir}/bin/pc-linux32
   cd bin/pc-linux32
   install -m755 * ${pkgdir}/opt/${_dstdir}/bin/pc-linux32
  fi 
}

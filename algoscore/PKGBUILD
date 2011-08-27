# Maintainer: waffenladen < holger at music-nerds dot net >
# Maintainer: Nathan O <ndowens.aur at gmail dot com>
pkgname=algoscore  
_pkgname=AlgoScore
pkgver=081112
pkgrel=4
pkgdesc="a graphical environment for algorithmic composition, where music is constructed directly in an interactive graphical score"
url="http://kymatica.com/Software/AlgoScore"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('csound5' 'gtk2' 'jack')
optdepends=('liblo: for OSC support')
makedepends=('cmake')
source=(http://download.gna.org/$pkgname/${_pkgname}-${pkgver}.tar.bz2 ${pkgname}.desktop ${pkgname}.patch hash.patch cmakelist.patch algoscorec.patch)
md5sums=('2fcedab831c93ba24a2cc3f4b8806000'
         'b8c957bed82fd9318f24212bedd101ed'
         'b28c4560a5f9447c6572fe8855a05f67'
         '927523192a748caa39b1c312c3c54f05'
         '4dfea5c2501b34d6180bcb9a566bdb2e'
         '6ae7c400b2e7bbbc5cc551c267fa4273')
	 
build() {

  cd "${srcdir}/${_pkgname}/src"
  install -d ${pkgdir}/usr/{lib/${pkgname},bin,share/{${pkgname},applications,pixmaps/${pkgname}}}
  patch -N -i ${srcdir}/cmakelist.patch
  patch -N -i ${srcdir}/algoscorec.patch
  cd ${srcdir}/${_pkgname}/src/nasal
  patch -N -i ${srcdir}/hash.patch
 cmake -DCMAKE_PREFIX_PATH=/ -DCMAKE_LIBRARY_PATH=/usr/lib .
  cd "${srcdir}/${_pkgname}/src"
  ./make_build
   cd "${srcdir}/${_pkgname}"
   cp -r lib/* ${pkgdir}/usr/lib/${pkgname}/
  install -Dm755 algoscore ${pkgdir}/usr/bin/algoscore
  install as_icon.png ${pkgdir}/usr/share/pixmaps/${pkgname}/algoscore.png
  install ${srcdir}/algoscore.desktop ${pkgdir}/usr/share/applications/

}

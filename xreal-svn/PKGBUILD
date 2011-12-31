# Maintainer: kfgz <kfgz at interia pl>

pkgname=xreal-svn
pkgver=4170
pkgrel=1
pkgdesc="xReal - The highly advanced id Tech 3 engine and free indie game project"
url="http://xreal-project.net/"
license=('GPL2' 'Creative Commons')
arch=('i686' 'x86_64')
conflicts=('xreal')
depends=('sdl>=1.2' 'freetype2>=2.3.5' 'openal>=1.7' 'curl>=7.15' 'gtk2>=2.4.0' \
         'gtkglext>=1.0' 'libxml2>=2.0' 'zlib>=1.2' 'glew>=1.5' 'boost>=1.35')
makedepends=('premake4' 'subversion')
source=('http://kfgz.mydevil.net/map-redm02-20090416.pk3' \
        'http://kfgz.mydevil.net/map-redm08-20090422.pk3' \
        'http://kfgz.mydevil.net/map-oddm01-20090623.pk3' \
        'http://kfgz.mydevil.net/map-ingardm1-20090421.pk3' \
        'http://kfgz.mydevil.net/map-gwdm2-20090302.pk3' \
        'xreal' \
        'xreal-dedicated' \
        'xreal.desktop')
noextract=('map-redm02-20090416.pk3' 'map-redm08-20090422.pk3' \
           'map-oddm01-20090623.pk3' 'map-ingardm1-20090421.pk3' \
           'map-gwdm2-20090302.pk3')
md5sums=('c7b43e0eafe2e0705f6ff9df50683f6a' \
         '590f46cae82a8f0f8dfb415fbebb4e76' \
         '9ddd5076638afe24dac8026189e80935' \
         'edc6e5b74836815afd734372c089611a' \
         '5649d3c3c6a93b76d65f0641d51b1787' \
         '83ba94b450348e118fe879df5476d3ff' \
         'ca3017dd2509db8e6af148f0ee6b9d4f' \
         '9815589d6f4da23ed1bd417c3fc205ff')
      
_svntrunk=https://xreal.svn.sourceforge.net/svnroot/xreal/trunk/xreal
_svnmod=XreaL

build() {
  msg2 'Do NOT delete the src/ directory because it takes a long time to clone via svn!'
  
  msg2 'Fetching files...'
  cd "${srcdir}"
  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up -r ${pkgver})
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi
  msg "SVN checkout done or server timeout"

  cp -r ${_svnmod} ${_svnmod}-build
  cd ${_svnmod}-build

  premake4 gmake
  
  if [ `uname -m` = "x86_64" ]; then
   make config=release64
  else
   make
  fi
}

package() {
  install -dm755 "${pkgdir}"/usr/{bin,lib/xreal,share/applications}

  cd ${_svnmod}-build
  if [ `uname -m` = "x86_64" ]; then
   install -m755 bin/linux-x86_64/xreal-dedicated "${pkgdir}"/usr/bin/xreal-dedicated.x86_64
   install -m755 bin/linux-x86_64/xreal-master "${pkgdir}"/usr/bin
   install -m755 bin/linux-x86_64/xmap2 "${pkgdir}"/usr/bin
   install -m755 bin/linux-x86_64/xreal "${pkgdir}"/usr/bin/xreal.x86_64
  else
   install -m755 bin/linux-i386/xreal-dedicated "${pkgdir}"/usr/bin/xreal-dedicated.i386
   install -m755 bin/linux-i386/xreal-master "${pkgdir}"/usr/bin
   install -m755 bin/linux-i386/xmap2 "${pkgdir}"/usr/bin
   install -m755 bin/linux-i386/xreal "${pkgdir}"/usr/bin/xreal.i386
  fi
 
  cp -R "${srcdir}"/${_svnmod}-build/base "${pkgdir}"/usr/lib/xreal/
  
  install -m644 "${srcdir}"/xreal.desktop "${pkgdir}"/usr/share/applications
  install -m644 "${srcdir}"/*.pk3 "${pkgdir}"/usr/lib/xreal/base/
  install -m755 "${srcdir}"/xreal-dedicated "${pkgdir}"/usr/bin
  install -m755 "${srcdir}"/xreal "${pkgdir}"/usr/bin

  rm -rf "${srcdir}"/${_svnmod}-build
}

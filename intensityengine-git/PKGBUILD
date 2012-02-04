# Original PKGBUILD code token from:
# xnitropl <xnitropl at gmail dot com>
# vbmithr
# Flamelab <panosfilip@gmail.com>
# 
# Maintainer:
# Adrián Chaves Fernández aka Gallaecio <adriyetichaves@gmail.com>
#
# Fixes and improvements thanks to:
# DarwinSurvivor <darwinsurvivor@gmail.com>
# qubodup <qubodup@gmail.com>

pkgname=intensityengine-git
_pkgname=intensityengine
pkgver=20100124
pkgrel=1
pkgdesc="The Intensity Engine is the open source project that forms the basis of Syntensity."
arch=('i686' 'x86_64')
url="http://www.syntensity.com/toplevel/intensityengine/"
license=('AGPL')
depends=('sdl' 'sdl_image' 'sdl_mixer' 'libgl' 'python' 'openjpeg' 'libstdc++5' 'mesa')
makedepends=('scons' 'boost' 'git' 'cmake')
install=${_pkgname}.install
source=("intensity-client.desktop"
	"intensity")
md5sums=('24411e644ebc2bce268fe72de0eac07c'
         '454378f1890b0fe28a53e3478eea7732')

_giturl="git://github.com/kripken/intensityengine.git"

build() 

{ 
    cd ${srcdir}/
    
    msg "Connecting to GIT server...."
    
      git clone ${_giturl}    
      
    msg "GIT checkout done."
    
    msg "Adding extra line to client CMakeLists.txt"
    
      # Temporal fix by RazZziel <razielmine@gmail.com>
      echo "target_link_libraries(Intensity_CClient rt)" >> ${srcdir}/${_pkgname}/src/client/CMakeLists.txt
    
    msg "Building Google V8 into Intensity..."
    
      cd ${srcdir}/${_pkgname}/src/thirdparty/v8/
      
      if [[ $CARCH = 'x86_64' ]]; then
	msg "...for a 64bit system..."
	GCC_VERSION="44" scons arch=x64 || return 1
      else
	msg "...for a 32bit system..."
	GCC_VERSION="44" scons || return 1
      fi
    
    
    msg "Building Intensity..."
    
      cd ${srcdir}/${_pkgname}/cbuild/
      cmake .. || return 1 
      make || return 1
      
    msg "Preparing package..."
  
      # copy data files
      mkdir -p ${pkgdir}/usr/share/games/${_pkgname}
      cp -r ${srcdir}/${_pkgname}/* ${pkgdir}/usr/share/games/${_pkgname}

      # move docs and licenses to right directory
      mkdir -p ${pkgdir}/usr/share/doc/${_pkgname}
      mv ${pkgdir}/usr/share/games/${_pkgname}/{docs,*.txt} ${pkgdir}/usr/share/doc/${_pkgname}

      # delete useless files
      rm -r ${pkgdir}/usr/share/games/${_pkgname}/{windows,tests,tools,*.bat}
      
      # Install menu entries
      install -D -m644 ${srcdir}/../intensity-client.desktop ${pkgdir}/usr/share/applications/intensity-client.desktop
      
      # Install executables
      install -D -m755 ${srcdir}/../intensity ${pkgdir}/usr/bin/intensity
      
}
# vim:set ts=2 sw=2 et:

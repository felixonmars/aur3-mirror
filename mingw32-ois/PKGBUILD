# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: scippio <scippio@berounet.cz>
pkgname=mingw32-ois
pkgver=1.2.0
pkgrel=2
pkgdesc="Object Oriented Input System"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/wgois"
license=('zlib/libpng')
makedepends=('autoconf>=2.5' 'automake>=1.7' 'libtool>=1.4' 'mingw32-gcc')
source=(http://downloads.sourceforge.net/project/ogre/ogre-dependencies-mingw/1.7/OgreDependencies_MinGW_20100216.zip)
md5sums=('533f7f78edb78441208ca41606de90a9')
options=('!strip')

# Sorry for using the cheap route with precompiled dependencies
# I'm not feeling very good about getting a 500MB MS SDK just for this

build() {
  cd ${srcdir}/Dependencies

  mkdir -p ${pkgdir}/usr/i486-mingw32/include
  mkdir -p ${pkgdir}/usr/i486-mingw32/lib

  cp -r include/OIS ${pkgdir}/usr/i486-mingw32/include/
  cp lib/Release/libOIS.a ${pkgdir}/usr/i486-mingw32/lib/
} 

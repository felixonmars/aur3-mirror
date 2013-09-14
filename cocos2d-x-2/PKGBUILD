# Contributor: Mikołaj Milej <mikolajmm at google mail>
_major=2
_release=${_major}.1.5
_appname=cocos2d-x

pkgname=${_appname}-${_major}
pkgver=${_release}
pkgrel=1
pkgdesc="Cocos2D-X is a game engine that supports multiple platforms
such as iOS, Android, WinXP/7/8, WP8, BlackBerry, MeeGo, Marmelade, WebOS, Mac OS X"
arch=('i686' 'x86_64')
url="http://www.cocos2d-x.org/"
license=('custom')
depends=('glfw2' 'glew' 'glibc' 'fontconfig' 'libgl' 'libx11' 'zlib')
makedepends=()
source=(http://cocos2d-x.googlecode.com/files/${_appname}-${_release}.zip)
sha1sums=('bb02fda2343ec524f91d17960fbb081c1ccf39f4')

_cocos2dx_mk="cocos2dx/proj.linux/cocos2dx.mk"

build() {
  _src_dir="${srcdir}/${_appname}-${_release}"
  cd ${_src_dir}
  #use glfw2 library
  sed -i 's/-lglfw /-lglfw2 /' ${_cocos2dx_mk}
  #fix build issues
  sed -i 's/-Werror / /' ${_cocos2dx_mk}

  #use gcc 4.8 debug optimizations
  sed -i 's/+= -g3 -O0/+= -g3 -Og/' ${_cocos2dx_mk}

  #make PLATFORM=linux DEBUG=1 all
  make PLATFORM=linux DEBUG=0 all
}

package() {
  _src_dir="${srcdir}/${_appname}-${_release}"
  _lib_dir=${_src_dir}/lib/linux/release
  _include_dir=cocos2dx/include
  _dest_include_dir=$pkgdir/usr/include/cocos2d/

  cd ${_src_dir}

  install -Dm 644 ${_lib_dir}/libcocos2d.so $pkgdir/usr/lib/libcocos2d.so
  install -Dm 644 ${_lib_dir}/libcocosdenshion.so $pkgdir/usr/lib/libcocosdenshion.so

  header_files=("ccConfig.h CCEventType.h ccMacros.h CCProtocols.h ccTypeInfo.h ccTypes.h cocos2d.h")

  for header_file in ${header_files}
  do
    install -Dm 644 ${_include_dir}/${header_file} ${_dest_include_dir}/${header_file}
  done
}

# vim:set ts=2 sw=2 et:

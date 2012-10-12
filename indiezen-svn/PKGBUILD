# Contributor: Abdallah Aly <l3thal8 @gmail.com>

pkgname=indiezen-svn
pkgver=2926
pkgrel=1
pkgdesc="high performance 3D game engine, contains Zen Engine, studio and worlds"
arch=(i686 x86_64)
url="http://www.indiezen.org"
license=('ZLib')
depends=('ogre' 'cegui' 'ois' 'lua' 'luafilesystem' 'sdl' 'libxml2' 'subversion' 'cmake' 'gtk' 'boost' 'wxgtk2.9')
makedepends=('subversion' 'cmake' 'lua')
provides=(indiezen)
conflicts=(indiezen)
md5sums=() #generate with 'makepkg -g'

_svntrunk_setup=svn://www.indiezen.org/zoss/Setup/trunk
_svnmod_setup=Setup

build() {


mkdir "$srcdir/build_zen"
mkdir "$srcdir/Zen"

cd "$srcdir/Zen"

  
  msg "getting $_svnmod_setup"
  if [ -d $_svnmod_setup/.svn ]; then
    (cd $_svnmod_setup && svn up -r $pkgver)
  else
    svn co $_svntrunk_setup --config-dir ./ -r $pkgver $_svnmod_setup
  fi  
  
  msg "SVN checkout done or server timeout"
  msg "Starting make..."

lua Setup/Package/zpkg.lua svn co
lua Setup/Package/zpkg.lua svn switch stable
lua Setup/Package/zpkg.lua svn update

export OGRE_CTHUGHA=/usr/include/OGRE/

sed -i "38c\#include <wx-2.9/wx/wx.h>" $srcdir/Zen/Studio/Workbench/src/PropertiesView.hpp
sed -i "39c\#include <wx-2.9/wx/propgrid/propgrid.h>" $srcdir/Zen/Studio/Workbench/src/PropertiesView.hpp

cp $srcdir/Zen/build/CMake/Modules/FindOGRE.cmake 
$srcdir/Zen/build/CMake/Modules/FindOgre.cmake
cd $srcdir/build_zen
cmake $srcdir/Zen/build/CMake
make
make DESTDIR="$pkgdir/" install
}


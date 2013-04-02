# Maintainer: Etienne Schmitt <etienne.schmitt123@gmail.com>
pkgname=schnapps
pkgver=20130402
pkgrel=1
pkgdesc="SCHNApps is a CGoGN Holder for Nice APPlicationS."
arch=('i686' 'x86_64')
url="http://cgogn.unistra.fr"
license=('GPL')
depends=('boost-libs' 'libzip' 'devil' 'freeglut' 'glew' 'gmp' 'qt4' 'suitesparse' 'libxml2' 'cgogn' 'libqglviewer')
makedepends=('boost' 'cmake' 'git' 'devil' 'libzip' 'freeglut' 'glew' 'gmp' 'qt4' 'suitesparse' 'libxml2' 'cgogn' 'libqglviewer')
source=('main.patch' 'window.patch' 'CMakePlugins.patch' 'CMakeLists.txt' 'schnappsRelease.patch' 'schnapps.svg' 'SCHNApps.desktop')
md5sums=('42123b931d451e1e3e233b3fdff7be2e'
         'a4ce6653699c3ffbe8db525663f157c6'
         'b262377a19a97b73978cb972c2442c25'
         '04bf7cfeb60cbce9ada54f89a4e00fff'
         '2177caa8d49d4d91cf6a79ac007694ae'
         'e6eb7c402b9cb4b594f2790ae3636daf'
         '7b1544811530b64be43b422f9200fe83')


_gitroot="https://github.com/cgogn/CGoGN.git"
_gitname="CGoGN"

build() {
    cd $srcdir
    msg "Connecting to the GIT server ..."

    if [ -d ${_gitname} ] ; then
   	 cd $_gitname && git pull origin
   	 msg 'The local files are updated.'
    else
    	msg 'getting sources...'
   	 git clone $_gitroot $_gitname
    fi
    rm $srcdir/CGoGN/cmake_modules/FindSuiteSparse.cmake
    cp -f ${srcdir}/CMakeLists.txt $srcdir/CGoGN/SCHNApps/CMakeLists.txt
    patch $srcdir/CGoGN/SCHNApps/src/window.cpp -i  ${srcdir}/window.patch
    patch $srcdir/CGoGN/SCHNApps/src/main.cpp -i  ${srcdir}/main.patch
#   patch $srcdir/CGoGN/SCHNApps/CMakeLists.txt -i ${srcdir}/CMakeSchnapps.patch
    patch $srcdir/CGoGN/SCHNApps/Release/CMakeLists.txt -i ${srcdir}/schnappsRelease.patch
    patch $srcdir/CGoGN/SCHNApps/Plugins/plugins_cmake.txt -i ${srcdir}/CMakePlugins.patch
    
    mkdir -p $srcdir/CGoGN/SCHNApps/build
    cd $srcdir/CGoGN/SCHNApps/build
    rm -rf *
    cmake ..
    make -j4
}

package(){
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/lib/SCHNApps
    mkdir -p $pkgdir/usr/share/SCHNApps
    mkdir -p $pkgdir/usr/share/icons/hicolor/scalable/apps/
    mkdir -p $pkgdir/usr/share/applications

    cp  $srcdir/CGoGN/SCHNApps/bin/schnappsInit.py $pkgdir/usr/share/SCHNApps/
    cp  $srcdir/CGoGN/SCHNApps/bin/SCHNApps $pkgdir/usr/bin/schnapps
    cp  $srcdir/CGoGN/SCHNApps/lib/* $pkgdir/usr/lib/SCHNApps/
    cp  $srcdir/schnapps.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/
    cp  $srcdir/SCHNApps.desktop $pkgdir/usr/share/applications

}


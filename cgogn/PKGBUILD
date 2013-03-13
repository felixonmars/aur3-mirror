# Maintainer: Etienne Schmitt <etienne.schmitt123@gmail.com>
pkgname=cgogn
pkgver=20130308
pkgrel=1
pkgdesc="CGoGN is a C++ topological geometric modeling kernel that provides efficient and generic data structures based on n-dimensional combinatorial maps."
arch=('i686' 'x86_64')
url="http://cgogn.unistra.fr"
license=('GPL')
depends=('boost-libs' 'libzip' 'devil' 'freeglut' 'glew' 'gmp' 'qt4' 'suitesparse' 'libxml2')
makedepends=('boost' 'cmake' 'git' 'devil' 'libzip' 'freeglut' 'glew' 'gmp' 'qt4' 'suitesparse' 'libxml2')
source=('patchSuiteSpare.patch' 'patchGlmAndNoDebug.patch' 'FindCGoGN.cmake' 'FindSuiteSparse.cmake')
md5sums=('1093962de2e5016f43da8304682bd6d0'
         '9c2425c1f4bb8869a7263debee4e2df5'
         'f6be08f835ae830180dda086a9837045'
         '06eb46d91613160bb89c6c0495e440aa')


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

    patch $srcdir/CGoGN/ThirdParty/OpenNL/CMakeModules/FindSuiteSparse.cmake -i ${srcdir}/patchSuiteSpare.patch
    patch $srcdir/CGoGN/cmake_modules/FindSuiteSparse.cmake -i ${srcdir}/patchSuiteSpare.patch
    patch $srcdir/CGoGN/CMakeLists.txt -i ${srcdir}/patchGlmAndNoDebug.patch
    mkdir -p $srcdir/CGoGN/ThirdParty/build
    cd $srcdir/CGoGN/ThirdParty/build
    rm -rf *
    
    cmake -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4 ..
    make -j4
    make install
    cd $srcdir/CGoGN/build/
    cmake -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4 -DONELIB=true ..
    make -j4
}

package(){
    mkdir -p $pkgdir/usr/lib/CGoGN/
    mkdir -p $pkgdir/usr/include/CGoGN/ThirdParty
    mkdir -p $pkgdir/usr/share/cmake-2.8/Modules/
    cp -r $srcdir/CGoGN/lib/Release $pkgdir/usr/lib/CGoGN/
    cp -r $srcdir/CGoGN/lib/Shaders $pkgdir/usr/lib/CGoGN/
    cp -r $srcdir/CGoGN/include/* $pkgdir/usr/include/CGoGN
    cp -r $srcdir/CGoGN/ThirdParty/include/* $pkgdir/usr/include/CGoGN/ThirdParty/
    cp  ${srcdir}/FindCGoGN.cmake $pkgdir/usr/share/cmake-2.8/Modules/
    cp  ${srcdir}/FindSuiteSparse.cmake $pkgdir/usr/share/cmake-2.8/Modules/
}


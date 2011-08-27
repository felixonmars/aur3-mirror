pkgname=kdeplasma-groupingdesktop-svn
pkgver=1177054
pkgrel=1
pkgdesc="This is an activity containment that adds to the desktop the ability to group your applets inside boxes."
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php?content=116926"
license=('GPL')
depends=('kdelibs>=4.6' 'kdebase-workspace>=4.6')
makedepends=('automoc4' 'subversion' 'cmake')
provides=('kdeplasma-groupingdesktop')
conflicts=('kdeplasma-groupingdesktop')
source=()
md5sums=()
groups=()
_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/KDE/kdeplasma-addons/containments/groupingdesktop/
_svnmod=kdeplasma-addons

build() {
    msg "Create or update code from Subversion site."
    cd ${srcdir}
    svn co -N svn://anonsvn.kde.org/home/kde/trunk/KDE/kdeplasma-addons/
    svn up -N kdeplasma-addons/containments
    svn up kdeplasma-addons/containments/groupingdesktop
    cd kdeplasma-addons
    awk '{if($1~/add_subdirectory/) {print ("#") $1} else {print}}' CMakeLists.txt > CMakeLists.txt1
    awk '{if($1~/add_subdirectory\(containments/) {print "add_subdirectory(containments)"} else {print}}' CMakeLists.txt1 > CMakeLists.txt
    rm ./CMakeLists.txt1
    cd containments
    awk '{if($1~/add_subdirectory/) {print ("#") $1} else {print}}' CMakeLists.txt > CMakeLists.txt1
    awk '{if($1~/add_subdirectory\(groupingdesktop/) {print "add_subdirectory(groupingdesktop)"} else {print}}' CMakeLists.txt1 > CMakeLists.txt
    rm ./CMakeLists.txt1
    cd ../..

    msg "SVN checkout done or server timeout"
    msg "Starting build ..."

    # copy to build directory
    cp -R ${srcdir}/${_svnmod} ${srcdir}/${_svnmod}-build
    cd ${_svnmod}-build

    cmake ${srcdir}/${_svnmod} -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE
    make || return 1
    make DESTDIR=${pkgdir} install || return 1

    # remove the build directory
    rm -rf ${srcdir}/${_svnmod}-build
}
# vim:set ts=2 sw=2 et:

# Contributor: Furyhunter <furyhunter600@gmail.com>

pkgname=kdevelop-extra-plugins-bazaar-svn
pkgver=1024814
pkgrel=1
pkgdesc="Bazaar VCS plugin for KDevelop development environment for KDE - SVN build"
arch=('i686' 'x86_64')
url="http://www.kdevelop.org/"
license=('GPL')
groups=('kde' 'kdevelop-extra-plugins')
depends=('kdevplatform')
optdepends=('kdevelop')
makedepends=('cmake' 'automoc4' 'subversion')
provides=('kdevelop-extra-plugins-bazaar')
conflicts=('kdevelop-extra-plugins-bazaar')
source=()
md5sums=()

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/playground/devtools/kdevelop4-extra-plugins/bazaar
_svnmod=kdevelop-extra-plugins-bazaar-svn

build() {
    cd ${srcdir}

    if [ -d ${_svnmod}/.svn ]; then
	rm ${_svnmod}/CMakeLists.txt
	(cd ${_svnmod} && svn up -r ${pkgver})
    else
	svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
    fi

    mkdir -p build
    cd build

    cmake ../${_svnmod} \
	-DCMAKE_SKIP_RPATH=ON \
	-DCMAKE_BUILD_TYPE=DEBUG \
	-DCMAKE_{SHARED,MODULE,EXE}_LINKER_FLAGS='-Wl,--no-undefined -Wl,--as-needed' \
	-DCMAKE_INSTALL_PREFIX=/usr || return 1

    make || return 1

    cd $srcdir/build/bazaar
    make DESTDIR=${pkgdir} install || return 1
}


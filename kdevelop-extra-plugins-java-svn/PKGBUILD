# Contributor: Harley Laue <losinggeneration@gmail.com>

pkgname=(kdevelop-extra-plugins-java-svn)
pkgver=1156158
pkgrel=2
pkgdesc="A Java plugin for KDevelop development environment for KDE - SVN build"
arch=('i686' 'x86_64')
url="http://www.kdevelop.org/"
license=('GPL')
groups=('kde' 'kdevelop-extra-plugins')
depends=('kdevplatform-git')
optdepends=('kdevelop-git')
makedepends=('cmake' 'automoc4' 'subversion' 'kdevelop-pg-qt-git' 'flex')
provides=('kdevelop-extra-plugins-java')
conflicts=('kdevelop-extra-plugins-java')
source=()
md5sums=()

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/playground/devtools/kdevelop4-extra-plugins/java
_svnmod=kdevelop-extra-plugins-java-svn

build() {
	cd ${srcdir}

	if [ -d ${_svnmod}/.svn ]; then
		rm ${_svnmod}/CMakeLists.txt
		(cd ${_svnmod} && svn up -r ${pkgver})
	else
		svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
	fi

	# Rebuilding frequently, comment this out
	[ -d build ] && rm -rf build

	mkdir -p build
	cd build

	# all of these (BUILD_*=OFF) are considered broken/unmaintained
	cmake ../${_svnmod} \
		-DCMAKE_SKIP_RPATH=ON \
		-DCMAKE_BUILD_TYPE=DEBUG \
		-DCMAKE_{SHARED,MODULE,EXE}_LINKER_FLAGS='-Wl,--no-undefined -Wl,--as-needed' \
		-DCMAKE_INSTALL_PREFIX=/usr || return 1

	make || return 1

	make DESTDIR=${pkgdir} install || return 1
}


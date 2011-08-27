# Maintainer: Callea Gaetano Andrea <callea:gaetano:andrea/gmail:com> 

pkgname=kdevelop-extra-plugins-ruby-svn
pkgver=1144334
pkgrel=5
pkgdesc="A Ruby plugin for KDevelop development environment for KDE - SVN build"
arch=('i686' 'x86_64')
url="http://www.kdevelop.org/"
license=('GPL')
depends=('kdevplatform-git')
optdepends=('kdevelop-git')
makedepends=('cmake' 'automoc4' 'subversion' 'kdevelop-pg-qt-git')
provides=('kdevelop-extra-plugins-ruby-svn')
install=kdevelop-extra-plugins-ruby-svn.install
source=()
md5sums=()

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/playground/devtools/kdevelop4-extra-plugins/ruby
_svnmod=ruby

build() {
	cd ${srcdir}

	if [[ -d ${_svnmod}/.svn ]]; then
		rm ${_svnmod}/CMakeLists.txt
		(cd ${_svnmod} && svn up -r ${pkgver})
	else
		svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
	fi

	# Rebuilding frequently, comment this out
	[[ -d build ]] && rm -rf build

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


# Maintainer: heaven <vo.zaeb at gmail.com>
# Contributor: Mateusz Kupisz <mkupisz-at-gmail.com>
pkgname='akonadi-googledata-svn'
pkgver=1143278
pkgrel=1
pkgdesc='Akonadi GoogleData Plugin (SVN version).'
arch=('i686' 'x86_64')
url='http://pim.kde.org/akonadi/'
license=('GPL')

depends=('libgcal-git' 'kdepimlibs>=4.2.0' 'libxslt')
makedepends=('subversion' 'cmake' 'automoc4')

_svntrunk='svn://anonsvn.kde.org/home/kde/trunk/extragear/pim/googledata'
_svnmod='googledata'
_buildir=${_svnmod}-build

build() {
	cd ${srcdir}

	msg 'Connecting to SVN server...'

	if [ -d ${_svnmod} ]; then
		cd ${_svnmod}
		svn up -r ${pkgver}
		cd ..
	else
		svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
	fi

	msg 'SVN checkout finished.'

	if [ -d ${_buildir} ]; then
		msg 'Cleaning previous build...'
		rm -rf ${_buildir}
	fi

	mkdir ${_buildir}
	cd ${_buildir}

	msg 'Starting make...'

	cmake -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix) -DCMAKE_BUILD_TYPE=Release ../${_svnmod} || return 1
	make || return 1
	make DESTDIR=${pkgdir} install || return 1

	rm -rf ${srcdir}/${_buildir}
}

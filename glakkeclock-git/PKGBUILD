# Maintainer: Glaucous <glakke1 at gmail dot com>
pkgname=glakkeclock-git
pkgver=20110531
pkgrel=1
pkgdesc="AMD/ATI graphics card utility, overclocking."
arch=('x86_64' 'i686')
url="https://sourceforge.net/projects/glakkeclock/"
license=('GPLv3')
groups=()
depends=('catalyst-utils' 'gcc-libs')
makedepends=('cmake>=2.8' 'git' 'gzip')
optdepends=()
provides=('glakkeclock')
conflicts=('glakkeclock')
replaces=()
backup=()
options=()
install=
changelog=
source=('http://download2-developer.amd.com/amd/GPU/zip/ADL_SDK_3.0.zip')
noextract=()
md5sums=('cf380f94502b6a2860c11b8fd6b19a3c')

_gitroot='git://github.com/ekroth/glakkeclock.git'
_gitname='glakkeclock'

build() {
	unset LDFLAGS

	cd ${srcdir}

	msg "Connecting to the GIT server.."
	if [[ -d ${srcdir}/${_gitname} ]] ; then
		cd ${_gitname}
		git pull origin
		msg "The local files are updated."
	else
		git clone ${_gitroot}
	fi

	msg "GIT checkout done."

	if [[ -d ${srcdir}/${_gitname}-build ]]; then
		msg "Cleaning the previous build directory.." 
		rm -rf ${srcdir}/${_gitname}-build
	fi

	msg "Cloning git.."

	git clone ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build

	msg "Moving ATI/AMD ADL include files to src.."
	mkdir -p $srcdir/${_gitname}-build/src/ADL
	mv ${srcdir}/include/* $srcdir/${_gitname}-build/src/ADL

	msg "Running cmake and make.."
	cd ${srcdir}/${_gitname}-build
	cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
	make
	make DESTDIR=${pkgdir} install
	cd ${pkgdir}/usr/share/man/man1/
	gzip glakkeclock.1
}

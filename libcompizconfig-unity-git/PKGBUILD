# Contributor: Flamelab <panosfilip@gmail.com>

# Compiz PKGBUILDs are based on "some-guy"'s previous PKGBUILDs

# Put the desired install prefix HERE
_iprefix=/opt/unity


pkgname=libcompizconfig-unity-git
pkgver=20110210
pkgrel=1
pkgdesc="Compiz configuration system library. Package meant for use with Unity."
arch=('i686' 'x86_64')
url="http://compiz.org"
license=('GPL')
depends=('compiz-core-unity-git' 'libxml2')
makedepends=('intltool' 'pkgconfig' 'git' 'cmake')
source=()
options=('!emptydirs' '!libtool')
_gitroot='git://anongit.compiz.org/compiz/compizconfig/libcompizconfig'
_gitname='libcompizconfig'
provides=("libcompizconfig++")

# This is a developement version
OPTIONS=(!strip)

# trick re-determining the build revision and, or entertain the hidden
# makepkg option --forcever, huh
if [ -z "${FORCE_VER}" ]; then
    msg "Determining latest build revision..."
    FORCE_VER=$(date +%Y%m%d)
fi

build()
{
	cd "${srcdir}"
	msg "Connecting to GIT server...."

	if [ -d ${_gitname} ] ; then
		cd "${_gitname}" && git pull origin
		msg "The local files are updated."
	else
		git clone ${_gitroot} ${_gitname}
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."
	cd "${srcdir}/${_gitname}"
	[[ -d build ]] || mkdir build
	cd build
	env PKG_CONFIG_PATH="${_iprefix}/lib/pkgconfig:$PKG_CONFIG_PATH"        \
		cmake .. -DCOMPIZ_PLUGIN_INSTALL_TYPE="compiz"                                             \
		         -DCMAKE_INSTALL_PREFIX="${_iprefix}"                                              \
		         -DCMAKE_BUILD_TYPE=Debug                                                          \
		         -DCOMPIZ_DESTDIR="${pkgdir}"
	make
	make install
	make findcompizconfig_install
}

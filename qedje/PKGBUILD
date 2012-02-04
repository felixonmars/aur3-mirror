# Package Name
# Contributor: Dylon Edwards <deltaecho@archlinux.us>

pkgname=qedje
pkgver=20091007
pkgrel=1

pkgdesc="Enlightenment Edje bindings for the Qt toolkit."
url="http://code.openbossa.org/projects/qedje"
license=('GPL')

arch=('i686' 'x86_64')

source=()
md5sums=()

depends=( 'qt' 'eet-svn' "qzion>=${pkgver}" )
makedepends=( 'git' 'gcc' 'cmake' 'make')

provides=( "qedje=${pkgver}" )

_gitroot="git://code.openbossa.org/qedje/mainline.git"
_gitname="qedje"

build() {

	# Get the sources
	if [ -d ${_gitname}/.git ]; then
		( cd ${_gitname} && git pull )
	else
		git clone ${_gitroot} ${_gitname}
	fi

	# Create the build directory
	mkdir -p ${_gitname}-build
	cd ${_gitname}-build

	# Configure the application
	if [ ! -f CMakeCache.txt ]; then
		cmake -DCMAKE_INSTALL_PREFIX=/usr \
		      -DCMAKE_BUILD_TYPE=RelWithDebInfo \
		      ${srcdir}/${_gitname} || return 1
	else
		cmake . || return 1
	fi

	# Make and install the package
	make DESTDIR=${pkgdir} install || return 1
}

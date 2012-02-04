# Package Name
# Contributor: Dylon Edwards <deltaecho@archlinux.us>

pkgname=qzion
pkgver=20091007
pkgrel=1

pkgdesc="A canvas abstraction used by and made for QEdje."
url="http://code.openbossa.org/projects/qzion"
license=('GPL')

arch=('i686' 'x86_64')

source=()
md5sums=()

depends=( 'qt' 'eet-svn' 'python' 'pyqt' 'sip' )
makedepends=( 'git' 'gcc' 'cmake' 'make' )

provides=( "qzion=${pkgver}" )

_gitroot="git://code.openbossa.org/qzion/mainline.git"
_gitname="qzion"

build() {

	# Get the source
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

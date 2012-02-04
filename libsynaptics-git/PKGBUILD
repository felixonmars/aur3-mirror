# Maintainer: Dylon Edwards <deltaecho@archlinux.us>

pkgname=libsynaptics-git
pkgver=20091007
pkgrel=3

url="http://github.com/mishaaq/libsynaptics"
pkgdesc="Uniform API for xorg synaptics driver"
license=('GPLv2')

arch=('x86_64' 'i686')

depends=('gcc-libs' 'glibc')
makedepends=('git')

_gitroot="git://github.com/mishaaq/libsynaptics"
_gitname="libsynaptics"

function build()
{
	# Get or update the Synaptics library source from GIT
	if [[ -d "${srcdir}/${_gitname}/.git" ]]; then
		( cd "${srcdir}/${_gitname}" && git pull origin )
	else
		git clone ${_gitroot} ${_gitname} ||
		return 1
	fi
	
	# Remove any old build files
	if [[ -d "${srcdir}/${_gitname}-build" ]]; then
		rm -rf "${srcdir}/${_gitname}-build" || 
		return 1
	fi
	
	# Compile the Synaptics library
	cp -a "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build" &&
	cd "${srcdir}/${_gitname}-build" &&
	./configure --prefix=/usr &&
	make ||
	return 1
}

function package()
{
	# Install the Synaptics library
	cd "${srcdir}/${_gitname}-build" &&
	make DESTDIR="${pkgdir}" install ||
	return 1
}

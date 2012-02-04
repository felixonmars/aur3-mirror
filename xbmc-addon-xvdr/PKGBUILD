# Mantainer: Arturo Martinez <martinez[at]embl.de>

pkgname=xbmc-addon-xvdr
pkgver=20120120
pkgrel=1
pkgdesc="Plugin for XBMC Media Center with to connect to vdr´s xvdr plugin"
provides=('xbmc-addon-xvdr')
conflicts=()
replaces=('vdr-plugin-vnsiserver')
arch=('i686' 'x86_64')
url="https://github.com/pipelka/xbmc-addon-xvdr.git"
license=('GPL' 'LGPL')
depends=('xbmc-dharma-pvr-git')
makedepends=('boost' 'cmake' 'git' 'gperf' 'nasm' 'python2' 'zip' 'libvdpau' 'udisks' 'upower' 'unrar')
optdepends=() 
options=('makeflags')
install="${pkgname}.install"
source=() 
md5sums=()

_gitroot="https://github.com/pipelka/xbmc-addon-xvdr.git"
_gitname="xbmc-addon-xvdr"
_prefix=/usr/lib/xbmc 

build() {
    cd "${srcdir}"
    msg "Connecting to GIT server...."

        git clone ${_gitroot}

    # Configure XBMC
    cd "${srcdir}/${_gitname}"

    sh autogen.sh

    # remove "--as-needed" from LDFLAGS
    unset LDFLAGS; LDFLAGS="-Wl,--hash-style=gnu"

    msg "Configuring XBMC" 
 	export PYTHON_VERSION=2    
	./configure --prefix=/usr/lib/xbmc 

    # Now build
    msg "Running make" 
    make ${MAKEFLAGS}
}

package() {

    cd "${srcdir}/${_gitname}"
    msg "Running make install" 
    make prefix="${pkgdir}${_prefix}" install


}

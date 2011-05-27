# Maintainer: Miguel Aguilar <zodiac_es@yahoo.es>
pkgname=gnome-shell-extension-workspace-indicator
_realname=workspace-indicator
pkgver=20110527
pkgrel=1
pkgdesc="Workspace-indicator extension for GNOME Shell"
arch=('i686' 'x86_64')
url="https://github.com/erick2red/shell-extensions"
license=('GPL2')

depends=('gnome-shell' 'gtk3')
makedepends=('git' 'gnome-common' 'intltool')
install=gnome-shell-extension-workspace-indicator.install
provides=("${_realname}")

options=(!libtool !emptydirs)

_gitroot="git://github.com/erick2red/shell-extensions"
_gitname="shell-extensions"

build() {


    cd ${srcdir}/

    msg "Connecting to the GNOME GIT server..."
    if [[ -d ${srcdir}/${_gitname} ]] ; then
    	cd ${_gitname}
    	git pull origin
    	msg "The local files are updated..."
    else
    	git clone ${_gitroot} ${_gitname}
    fi

    msg "GIT checkout done."

    msg2 "Starting make for: ${pkgname}"

    if [[ -d ${srcdir}/${_gitname}-build ]]; then
       msg "Cleaning the previous build directory..."
       rm -rf ${srcdir}/${_gitname}-build
    fi

    git clone ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build

    cd ${srcdir}/${_gitname}-build

    msg "Starting configure..."

    #Workaround on version checking problem
    sed -i -e "s|3.0.1|3.0.2|" configure.ac

    ./autogen.sh --prefix=/usr --disable-schemas-compile    
    make
}

package()
{
    cd ${srcdir}/${_gitname}-build
    make DESTDIR="${pkgdir}" install
}

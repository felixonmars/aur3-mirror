# Contributor: Flamelab <panosfilip@gmail.com>
# Contrubutor: hobarrera <hugo@osvaldobarrera.com.ar>

pkgname=taskview-git
_realpkgname=TaskView
pkgver=20110504
pkgrel=2
pkgdesc="The TaskView Project aims to create a set of APIs and libraries, which enables application developers to export information related to the Tasks."
arch=("i686" "x86_64")
url="https://github.com/ssickert/TaskView"
depends=('glib2')
makedepends=('git' 'gnome-common' 'gtk-doc')
license=('GPL')

_gitroot="git://github.com/ssickert/TaskView.git"
_gitname="TaskView"

build() 

{ 
    cd ${srcdir}/

    msg "Connecting to the GIT server...."
    if [[ -d ${srcdir}/${_gitname} ]] ; then
    	cd ${_gitname}
    	git pull origin
    	msg "The local files are updated..."
    else
    	git clone ${_gitroot}
    fi
    
    msg "GIT checkout done."

    msg "Starting make for: ${pkgname}"
    
    if [[ -d ${srcdir}/${_gitname}-build ]]; then
       msg "Cleaning the previous build directory..." 
       rm -rf ${srcdir}/${_gitname}-build
    fi

    git clone ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
    
    cd ${srcdir}/${_gitname}-build
        
    msg "Starting configure..."

    ./autogen.sh --prefix=/usr
    
    msg "Starting make..."
    make
}

package()

{
    cd ${srcdir}/${_gitname}-build
    make DESTDIR=${pkgdir} install 
}

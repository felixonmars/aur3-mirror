# Maintainer: Michal Gawronski <dinth1906@gmail.com>
pkgname='firefox-extension-firefoxnotify-git'
pkgver=20100524
pkgrel=1
pkgdesc="Gnome notification extension for Firefox"
arch=('i686' 'x86_64')
url='http://github.com/linkinpark342/firefoxnotify/'
license=('GPL')
depends=('firefox>=3.6')
makedepends=('git')
optdepends=()
provides=('firefox-extension-firefoxnotify')
conflicts=()
source=(firefox-3.6.patch)
md5sums=('13ad548c9eb58c031fafca7c75822239')
_gitroot="git://github.com/linkinpark342/firefoxnotify.git"
_gitname="firefoxnotify"

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
    
	patch -Np2 -i ../firefox-3.6.patch || return 1
    
    make || return 1

	mkdir -p ${pkgdir}/usr/lib/firefox-3.6/extensions
	unzip ${srcdir}/${_gitname}-build/FirefoxNotify*.xpi -d ${pkgdir}/usr/lib/firefox-3.6/extensions/firefoxnotify@abhishek.mukherjee


    msg "If you'd prefer the package in xpi format, it can be found in the following directory"
    msg2 "${srcdir}/${_gitname}/"


}

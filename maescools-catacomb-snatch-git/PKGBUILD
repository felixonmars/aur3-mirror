# Maintainer: Daniel Nögel. <arch  noegelmail  de>

pkgname=maescools-catacomb-snatch-git
pkgver=20120223
pkgrel=1
pkgdesc="Catacomb Snatch is a real-time strategy shoot'em up with a steampunk ancient Egypt theme."
arch=(any)
url="https://github.com/Maescool/Catacomb-Snatch"
license=('custom')
depends=('java-runtime' 'xorg-server-utils' 'openal')
makedepends=('git' 'gradle')
source=(http://assets.mojang.com/mojam/cs_icon.png catacomb-snatch.desktop catacomb-snatch)
md5sums=('5ab1eee2b8690b6671073ba62423b3a2'
         '040847ddc7698129b98d302075adc8f9'
         '351c623e1798eb4a929bd02c603af848')

_gitroot="git://github.com/Maescool/Catacomb-Snatch.git"
_gitname="Catacomb-Snatch"

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

    gradle build


}

package() {
    cd ${srcdir}/${_gitname}-build
    cd build/libs    
    install -D -m644 Catacomb-Snatch*.jar ${pkgdir}/usr/bin/catacomb-snatch.jar

    cd ${srcdir}
    install -D -m644 catacomb-snatch.desktop ${pkgdir}/usr/share/applications/catacomb-snatch.desktop
    install -D -m755 catacomb-snatch ${pkgdir}/usr/bin/catacomb-snatch
    install -D -m644 cs_icon.png ${pkgdir}/usr/share/icons/catacomb-snatch.png
}





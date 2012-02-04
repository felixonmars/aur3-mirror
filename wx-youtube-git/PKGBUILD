# This is an example PKGBUILD file. Use this as a start to creating your 
#own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is 
#unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=wx-youtube-git
pkgver=20110719
pkgrel=1
pkgdesc="A youtube video downloader, using wxGTK"
arch=('x86_64' 'i686')
url="https://github.com/cgroza/wx-Youtube"
license=('GPL')
groups=()
depends=()
makedepends=(wxgtk boost curl git)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'
_gitroot="git://github.com/cgroza/wx-Youtube.git"
_gitname="wx-Youtube"



build()
{
cd ${srcdir}

    msg "Connecting to the GIT server...."
    if [[ -d ${srcdir}/${_gitname} ]] ; then
        cd ${_gitname}
        git pull origin
        msg "The local files are updated..."
    else
        git clone ${_gitroot} --depth=1
    fi
    
    msg "GIT checkout done."

    msg "Starting make for: ${pkgname}"
    
    if [[ -d ${srcdir}/${_gitname}-build ]]; then
       msg "Cleaning the previous build directory..." 
       rm -rf ${srcdir}/${_gitname}-build
    fi

    mv ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
    
    cd ${srcdir}/${_gitname}-build/src
        
    echo `pwd`
    make
    mkdir $pkgdir/usr
    mkdir $pkgdir/usr/bin
    cp ${_gitname} $pkgdir/usr/bin/wx-youtube || return 1
    

}




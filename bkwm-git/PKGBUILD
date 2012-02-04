pkgname=bkwm-git
pkgver=20110406
pkgrel=1
pkgdesc="bkwm - tiling window management"
url="http://github.com/bklive/bkwm"
license=('GPL')
depends=('libx11')
makedepends=('gcc' 'make' 'git')
arch=(i686 x86_64)
source=()
md5sums=()
 
_gitroot="git://github.com/bklive/bkwm.git"
_gitname="bkwm"
 
build() {
    msg "Connecting to GIT server...."

    # if local repo already exist
    if [[ -d $startdir/src/$_gitname ]] ; then
        cd $_gitname
        git pull origin || return 1
        msg "The local files are updated."
        # else clone
    else
        git clone $_gitroot || return 1
    fi

    msg "GIT checkout done"
    msg "Starting make..."

    # build directory
    cd $srcdir/$_gitname

    make DESTDIR=${pkgdir} install || return 1
}

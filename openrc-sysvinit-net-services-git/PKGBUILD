# Maintainer: udeved <brainbug75@gmx.net>

pkgname=openrc-sysvinit-net-services-git
pkgdesc="Arch Linux net service scripts for openrc"
pkgver=20121117
pkgrel=9
url="https://github.com/udeved/openrc-sysvinit-net-services"
license=('GPL2')
arch=('i686' 'x86_64')
backup=('etc/conf.d/svnserve' 'etc/conf.d/sshd')
provides=('openrc-sysvinit-services')
depends=('openrc-sysvinit-git')
optdepends=('openrc-sysvinit-desktop-services-git')

_gitroot="$url.git"
_gitname='openrc-sysvinit-net-services'

build() {
    cd $srcdir

    msg "Connecting to GIT server...."

    if [ -d $srcdir/$_gitname ] ; then
        cd $_gitname
        git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot
        cd $_gitname
    fi

    msg "GIT checkout done or server timeout"
}

package() {
    cd $srcdir/$_gitname
    make \
        SYSCONFDIR='/etc' \
        DESTDIR="$pkgdir" \
        install
}
md5sums=()

# Maintainer: udeved <brainbug75@gmx.net>

pkgname=openrc-sysvinit-base-services-git
pkgdesc="Arch Linux base service scripts for openrc"
pkgver=20121117
pkgrel=9
url="https://github.com/udeved/openrc-sysvinit-base-services"
license=('GPL2')
arch=('i686' 'x86_64')
backup=('etc/conf.d/syslog-ng' 'etc/conf.d/lm_sensors')
provides=('openrc-sysvinit-services')
depends=('openrc-sysvinit-git')
optdepends=('openrc-sysvinit-net-services-git' 'openrc-sysvinit-desktop-services-git')

_gitroot="$url.git"
_gitname='openrc-sysvinit-base-services'

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

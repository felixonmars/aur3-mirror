# Maintainer: udeved <brainbug75@gmx.net>

pkgname=openrc-sysvinit-git
pkgdesc="Dependency based init system that works with sysvinit."
pkgver=20121117
pkgrel=5
url="http://www.gentoo.org/proj/en/base/openrc/"
license=('BSD')
backup=('etc/rc.conf')
arch=('i686' 'x86_64')
provides=('openrc-sysvinit-git')
depends=('sysvinit' 'net-tools')
conflicts=('openrc' 'initscripts' 'openrc-git')
makedepends=('git')
groups=('base')


_gitroot="git://git.overlays.gentoo.org/proj/openrc.git"
_gitname="openrc"

build() {
    cd "$srcdir"

    msg "Connecting to GIT server...."

    if [ -d "$srcdir/$_gitname" ] ; then
        cd "$_gitname"
        git pull origin
        msg "The local files are updated."
    else
        git clone "$_gitroot"
        cd "$_gitname"
    fi

    msg "GIT checkout done or server timeout"
}

package() {
    cd "$srcdir/$_gitname"

    make \
        SYSCONFDIR='/etc' \
        BRANDING='Arch Linux' \
        MKSELINUX='no' \
        DESTDIR="$pkgdir" \
        PKG_PREFIX='' \
        MKTERMCAP=ncurses \
        install

    install -m 644 "$srcdir/openrc/support/sysvinit/inittab" "$pkgdir/etc/inittab"
}
md5sums=()

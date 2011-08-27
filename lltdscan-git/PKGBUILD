
# <fedor@yu.wildpark.net>

pkgname=lltdscan-git
pkgver=20100124
pkgrel=1
pkgdesc="Scan for LLTD-enabled hosts on your network"
url="http://github.com/zed-0xff/lltdscan"
arch=('i686' 'x86_64')
license=('GPL')
depends=('pcap' 'libnet')
makedepends=('git')
provides=('lltdscan')

_gitroot="git://github.com/zed-0xff/lltdscan.git"
_gitname="lltdscan"

build() {
    cd ${srcdir}

    msg "Connecting to the git repository..."
    if [ -d ${srcdir}/${_gitname} ]; then
        cd ${_gitname}
        git pull origin
    else
        git clone --depth 1 ${_gitroot}
    fi
    msg "GIT checkout done or server timeout"

    rm -rf ${srcdir}/${_gitname}-build
    cp -r  ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
    cd ${srcdir}/${_gitname}-build

    msg "Starting make..."
    make || return 1
    install -m 755 -D lltdscan $pkgdir/usr/sbin/lltdscan
    gzip lltdscan.8
    install -m 644 -D lltdscan.8.gz $pkgdir/usr/man/man8/lltdscan.8.gz
}

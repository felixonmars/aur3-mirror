# Maintainer: Marcus Carlsson <carlsson.marcus@gmail.com>
pkgname=charybdis-hg
pkgver=20101102
pkgrel=1
pkgdesc="A modular, scalable IRC daemon"
arch=('any')
url="http://hg.atheme.org/charybdis/"
license=('GPL')
depends=('openssl' 'flex' 'bison' 'zlib')
makedepens=('mecurial')
source=('ircd.d')
install='charybdis.install'
provides=('charybdis')
conflicts=('charybdis')
md5sums=('dda13e85f749ebcc2a0440c7474fa77a')

_hgroot="http://hg.atheme.org/charybdis/"
_hgname="charybdis"

build() {
    cd $srcdir

    msg "Connecting to the mecurial-server"
    if [ -d $_hgname ]; then
        (cd $_hgname && hg update || return 1)
    else
        hg clone $_hgroot || return 1
    fi

    rm -rf ${_hgname}-build
    cp -r $_hgname ${_hgname}-build
    cd ${_hgname}-build

    msg "Starting build process."

    ./configure --prefix="/usr/local/ircd" \
        --bindir=/usr/sbin/ \
        --with-confdir=/etc/charybdis \
        --with-logdir=/var/log/charybdis \
        --enable-epoll \
        --enable-openssl \
        --disable-assert \
        --enable-small-net \
        --with-nicklen=10 || return 1

    make || return 1
}

package() {
    cd $srcdir/${_hgname}-build
    make DESTDIR=$pkgdir install || return 1
    install -D -m755 "$srcdir/ircd.d" "$pkgdir/etc/rc.d/ircd"
}
